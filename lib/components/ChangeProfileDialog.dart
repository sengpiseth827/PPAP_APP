import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
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
                      new Text("Change Profile",style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 5.0, right: 5.0),
                          child: new Column(
                            children: <Widget>[
                              CustomTextField(
                                controller: null,
                                label: "Enter New Username",
                                isPassword: true,
                                icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                controller: null,
                                label: "Enter New Email ",
                                isPassword: true,
                                icon: Icon(Icons.email, size: 20,color: Color(0xFFF032f41),),
                              ),
                              SizedBox(height: 20),
                              ButtonLoginAnimation(
                                label: "Ok",
                                background: Color(0xFF00c000),
                                fontColor: Colors.white,
                                borderColor: Colors.white,
                                onTap: () async {
//                            await Provider.of<ApiService>(context, listen: false).getUser(etEmail.text.toString(), etPassword.text.toString());
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