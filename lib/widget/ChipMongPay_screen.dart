
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/customDescriptionTextfield.dart';
import 'package:ppapapp/model/ScreenArguments.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/ABACheckout_screen.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChipMongPayScreen extends StatefulWidget {

  @override
  _ChipMongPayScreenState createState() => _ChipMongPayScreenState();
}

class _ChipMongPayScreenState extends State<ChipMongPayScreen> {

  TextEditingController etFristname = new TextEditingController();
  TextEditingController etLastname = new TextEditingController();
  TextEditingController etPhonenumber = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etDescription = new TextEditingController();

  String amount="",userid="",company="";
  SharedPreferences sharedPreferences;
  String account="";
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    setState(() {
      getUserInfo();
    });
  }
  getUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null) {
      String userId = sharedPreferences.getString("token");
      final api = Provider.of<ApiService>(context, listen: false);
      api.getUser().then((it)  {
        it.forEach((f) async {
          if(f.sysId == userId){
            setState(() {
              etFristname.text = f.firstName;
              etEmail.text = f.email;
              etPhonenumber.text = f.tel;
              etLastname.text = f.lastName;
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
    final ScreenArguments data = ModalRoute.of(context).settings.arguments;
    final api = Provider.of<ApiService>(context, listen: false);
    api.getInvoice(data.data).then((it)  {
      it.forEach((f) async {
        setState(() {
          amount = f.amount;
          company = f.company;
        });
      });
    }).catchError((onError){
      print(onError.toString());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Checkout',
            style: TextStyle(
                color: Colors.white,
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
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: etLastname,
                    label: "Last Name",
                    isPassword: false,
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(height: 15),
                  CustomDescriptionTextField(
                    controller: etPhonenumber,
                    label: "Phone Number",
                    isPassword: false,
                    icon: Icon(Icons.phone),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: etEmail,
                    label: "Email",
                    isPassword: false,
                    icon: Icon(Icons.email),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: etDescription,
                    label: "Description",
                    isPassword: false,
                    icon: Icon(Icons.edit),
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
                            "Invoice Number:",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            data.data,
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
                            company,
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
                            "Amount:",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                           amount+' USD',
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
                          amount+' USD',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 50,
                        child: Image.asset("assets/images/payway.jpg"),
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonLoginAnimation(
                      label: "NEXT",
                      background: Color(0xFF039be5),
                      fontColor: Colors.white,
                      borderColor: Colors.white,
                      onTap: () async {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=>new ABACheckoutScreen(),
                            settings: RouteSettings(arguments: ScreenArguments(data.data,"ABA"))
                        ));
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