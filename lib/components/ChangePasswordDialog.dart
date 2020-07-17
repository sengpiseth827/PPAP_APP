import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'buttonLoginAnimation.dart';
import 'customTextfield.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<ChangePasswordDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController etoldPassword = new TextEditingController();
  TextEditingController etnewPassword = new TextEditingController();
  SharedPreferences sharedPreferences;
  String sysID = "";

  @override
  void initState() {
    super.initState();

    getUserInfo();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  getUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
    }else{
      String userId = sharedPreferences.getString("token");
      final api = Provider.of<ApiService>(context, listen: false);
      api.getUser().then((it)  {
        it.forEach((f) async {
          if(f.sysId == userId){
            setState(() {
              sysID = f.sysId;
            });
          }
        });
      }).catchError((onError){
        print(onError.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
              child: Container(
                  width: 200,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      new Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 5.0, right: 5.0),
                        child: new Column(
                          children: <Widget>[
                            CustomTextField(
                              controller: etoldPassword,
                              label: "Enter Old Password",
                              isPassword: true,
                              icon: Icon(Icons.https, size: 20,color: Color(0xFFF032f41),),
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              controller: etnewPassword,
                              label: "Enter New Password",
                              isPassword: true,
                              icon: Icon(Icons.https, size: 20,color: Color(0xFFF032f41),),
                            ),
                            SizedBox(height: 20),
                            ButtonLoginAnimation(
                              label: "Ok",
                              background: Color(0xFF00c000),
                              fontColor: Colors.white,
                              borderColor: Colors.white,
                              onTap: () async {
                                  await Provider.of<ApiService>(context, listen: false).ChangePassword(etoldPassword.text,etnewPassword.text,sysID).then((it) async{
                                    Navigator.of(context).pop();
                                  });
                              },
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}