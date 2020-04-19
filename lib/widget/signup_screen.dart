import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter
              )
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white,size:32),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.slow_motion_video, color: Colors.white,size: 32),
                              Text("32°", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              )),
                              Text("Sat, 3 Aug", style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                    height: MediaQuery.of(context).size.height * 0.70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome",style: TextStyle(
                          color: Color(0xFFF032f42),
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        )),
                        Text("Sign to continue",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                        )),
                        SizedBox(height: 40),
                        CustomTextField(
                          controller: etEmail,
                          label: "Email",
                          icon: Icon(Icons.person, size: 27,color: Color(0xFFF032f41),),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: etPassword,
                          label: "Password",
                          isPassword: true,
                          icon: Icon(Icons.https, size: 27,color: Color(0xFFF032f41),),
                        ),
                        SizedBox(height: 40),
                        ButtonLoginAnimation(
                          label: "Login",
                          background: Colors.cyan,
                          fontColor: Colors.white,
                          borderColor: Colors.white,
                          onTap: () async {
//                            await Provider.of<ApiService>(context, listen: false).Login(etEmail.text.toString(), etPassword.text.toString());
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}