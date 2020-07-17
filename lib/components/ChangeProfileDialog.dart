import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'buttonLoginAnimation.dart';
import 'customTextfield.dart';

class ChangeProfileDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<ChangeProfileDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController etFirstname = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etAddress = new TextEditingController();
  TextEditingController etPhone = new TextEditingController();
  TextEditingController etLastname = new TextEditingController();
  SharedPreferences sharedPreferences;
  String sysID ="";

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
                  width: 250,
                  height: 450,
                  child: Column(
                    children: <Widget>[
                      new Text("Change Profile",style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 5.0, right: 5.0),
                          child: new Column(
                            children: <Widget>[
                              CustomTextField(
                                controller: etFirstname,
                                label: "Enter New First Name",
                                isPassword: false,
                                icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                controller: etLastname,
                                label: "Enter New Last Name",
                                isPassword: false,
                                icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                controller: etPhone,
                                label: "Enter New Phone Number",
                                isPassword: false,
                                icon: Icon(Icons.phone, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                controller: etEmail,
                                label: "Enter New Email ",
                                isPassword: false,
                                icon: Icon(Icons.email, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                controller: etAddress,
                                label: "Enter New Address",
                                isPassword: false,
                                icon: Icon(Icons.location_on, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 20),
                              ButtonLoginAnimation(
                                label: "Ok",
                                background: Color(0xFF00c000),
                                fontColor: Colors.white,
                                borderColor: Colors.white,
                                onTap: () async {
                                    await Provider.of<ApiService>(context, listen: false).ChangeProfile(etFirstname.text,etLastname.text,
                                        etPhone.text, etEmail.text, etAddress.text,sysID).then((it) async{
                                        Navigator.of(context).pop();
                                    });
                                },
                              ),
                            ],
                          )
                      )
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