
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/customDescriptionTextfield.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';

class WingPayScreen extends StatefulWidget {

  @override
  _WingPayScreenState createState() => _WingPayScreenState();
}

class _WingPayScreenState extends State<WingPayScreen> {

  TextEditingController etFristname = new TextEditingController();
  TextEditingController etLastname = new TextEditingController();
  TextEditingController etPhonenumber = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey[50],
          title: Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
            ),
          )
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Enter your personal information',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      controller: etFristname,
                      label: "First Name",
                      isPassword: false,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      controller: etLastname,
                      label: "Last Name",
                      isPassword: false,
                    ),
                    SizedBox(height: 15),
                    CustomDescriptionTextField(
                      controller: etPhonenumber,
                      label: "Phone Number",
                      isPassword: false,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      controller: etEmail,
                      label: "Email",
                      isPassword: false,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Transaction Summary",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Order ID:",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'PR03948828828',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Company:",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Company Name',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Subtotal:",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '0.50 USD',
                              style: TextStyle(color: Colors.black,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TOTAL:",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '0.55 USD',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Image.asset("assets/images/payway.jpg"),
                      ),
                      SizedBox(height: 20),
                      ButtonLoginAnimation(
                        label: "NEXT",
                        background: Color(0xFF039be5),
                        fontColor: Colors.white,
                        borderColor: Colors.white,
                        onTap: () async {

                        },
                      ),
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}