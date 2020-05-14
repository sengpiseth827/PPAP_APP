
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/customDescriptionTextfield.dart';
import 'package:ppapapp/components/customTextfieldContact.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';

class FTBPayScreen extends StatefulWidget {

  @override
  _FTBPayScreenState createState() => _FTBPayScreenState();
}

class _FTBPayScreenState extends State<FTBPayScreen> {

  TextEditingController etAccount = new TextEditingController();
  TextEditingController etAmount = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Payment',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/ftb.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(bottom: 15),
                   child: Text(
                     "Account Number : 000454947",
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFFF234253)),
                   ),
                 ),
                  CustomTextField(
                    controller: etAccount,
                    label: "Bank Account Number",
                    isPassword: false,
                    icon: Icon(Icons.account_balance, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: etAmount,
                    label: "Amount",
                    isPassword: false,
                    icon: Icon(Icons.attach_money, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 5),
                  CustomDescriptionTextField(
                    controller: etAmount,
                    label: "Description",
                    isPassword: false,
                    icon: Icon(Icons.create, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  ButtonLoginAnimation(
                    label: "PAY",
                    background: Color(0xFF00cc00),
                    fontColor: Colors.white,
                    borderColor: Colors.white,
                    onTap: () async {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.INFO,
                        body: Center(child: Text(
                          'Please check your information again!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),),
                        tittle: 'This is Ignored',
                        desc:   'This is also Ignored',
                        btnOkOnPress: () async{},
                      ).show();
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}