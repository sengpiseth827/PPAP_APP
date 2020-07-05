
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
import 'package:ppapapp/widget/login_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ABACheckoutScreen extends StatefulWidget {

  @override
  _ABACheckoutScreenState createState() => _ABACheckoutScreenState();
}

class _ABACheckoutScreenState extends State<ABACheckoutScreen> {

  String amount="",userid="",company="",email="",phonenumber="",username="";
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
              email = f.email;
              phonenumber = f.tel;
              username = f.userName;
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
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('How do you want to pay?',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 10),
                  new Card(
                    color: Colors.grey[100],
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card was tapped');
                      },
                      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            new ListTile(
                              title: Text("ABA Mobile",style: TextStyle(fontSize: 16,color: Colors.black)),
                              trailing: Image.asset("assets/images/pay.jpg"),
                              subtitle: Text("Pay with QR code via ABA Mobile App on your phone"),
                              onTap: (){

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Card(
                    color: Colors.grey[100],
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card was tapped');
                      },
                      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            new ListTile(
                              title: Text("Debit/Credit Card",style: TextStyle(fontSize: 16,color: Colors.black)),
                              trailing: Image.asset("assets/images/visa.jpg",height: 30),
                              subtitle: Text("Pay with Visa, MasterCard and many other credit and debit cards."),
                              onTap: (){

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ListTile(
                    title: Text("Your contact detail",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit),
                  ),
                  new ListTile(
                    title: Text(username,style: TextStyle(fontSize: 16,color: Colors.black),),
                    leading: Icon(Icons.person),
                  ),
                  new ListTile(
                    title: Text(email,style: TextStyle(fontSize: 16,color: Colors.black),),
                    leading: Icon(Icons.email),
                  ),
                  new ListTile(
                    title: Text(phonenumber,style: TextStyle(fontSize: 16,color: Colors.black),),
                    leading: Icon(Icons.phone),
                  ),
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
                  ],
                )
            ),
          ],
        )
      ),
    );
  }
}