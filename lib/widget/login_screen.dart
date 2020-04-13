import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/animation/fadeAnimation.dart';
import 'package:ppapapp/components/customButtonAnimation.dart';
import 'package:ppapapp/components/loginbutton.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFFFFFFFF).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(left: 150/2),
                      child: FadeAnimation(2.4,Image.asset("assets/images/logo.jpg", fit: BoxFit.cover))
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(2.8,LoginButton(
                      label: "Log In",
                      background: Color(0xFF0000b3),
                      fontColor: Colors.white,
                      borderColor: Colors.white,
                    )),
                    SizedBox(height: 20),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Sign Up",
                      backbround: Color(0xFF00e600),
                      borderColor: Colors.white,
                      fontColor: Color(0xFFFFFFFF),
                      child: LoginScreen(),
                    )),
                    SizedBox(height: 70),
                    FadeAnimation(3.4,Text("Phnom Penh Autonomous Port", style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                    ))),
                    SizedBox(height: 10),
                    FadeAnimation(3.6,Text("Version 0.1.0", style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
