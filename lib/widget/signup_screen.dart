import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/screen/content_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xFF0000b3),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
              height: MediaQuery.of(context).size.height,
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
                  CustomTextField(
                    controller: etEmail,
                    label: "Firstname",
                    icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etEmail,
                    label: "Lastname",
                    icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etEmail,
                    label: "Company",
                    icon: Icon(Icons.whatshot, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etEmail,
                    label: "Phone Number",
                    icon: Icon(Icons.phone, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etEmail,
                    label: "Email",
                    icon: Icon(Icons.email, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etPassword,
                    label: "Password",
                    isPassword: true,
                    icon: Icon(Icons.https, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 30),
                  ButtonLoginAnimation(
                    label: "Submit",
                    background: Color(0xFF00cc00),
                    fontColor: Colors.white,
                    borderColor: Colors.white,
                    onTap: () async {
//                            await Provider.of<ApiService>(context, listen: false).getUser(etEmail.text.toString(), etPassword.text.toString());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}