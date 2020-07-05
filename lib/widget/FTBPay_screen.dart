
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/customDescriptionTextfield.dart';
import 'package:ppapapp/model/ScreenArguments.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/screen/content_screen.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class FTBPayScreen extends StatefulWidget {

  @override
  _FTBPayScreenState createState() => _FTBPayScreenState();
}

class _FTBPayScreenState extends State<FTBPayScreen> {

  TextEditingController etAccount = new TextEditingController();
  TextEditingController etAmount = new TextEditingController();
  TextEditingController etDescription = new TextEditingController();
  String amount="",userid="";
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
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
    }else{
       setState(() {
         userid = sharedPreferences.getString("token");
         print("user ID" +userid);
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
          etAmount.text = f.amount;
          amount = f.amount;
        });
      });
    }).catchError((onError){
      print(onError.toString());
    });
    final api1 = Provider.of<ApiService>(context, listen: false);
    api1.getBank(data.message).then((it)  {
      it.forEach((f) async {
        setState(() {
          account = f.accnumber;
          print("Account : "+account);
        });
      });
    }).catchError((onError){
      print(onError.toString());
    });
    setState(() {
      if(amount == null){
        amount = etAmount.text;
      }
    });
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
                     "Account Number : "+account,
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFFF234253)),
                   ),
                 ),
                  CustomTextField(
                    controller: etAccount,
                    label: "Bank Account Number",
                    isPassword: false,
                    icon: Icon(Icons.account_balance, size: 20,color: Color(0xFFF032f41)),
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: etAmount,
                    label: "Amount",
                    isPassword: false,
                    icon: Icon(Icons.attach_money, size: 20,color: Color(0xFFF032f41)),
                  ),
                  SizedBox(height: 5),
                  CustomDescriptionTextField(
                    controller: etDescription,
                    label: "Description",
                    isPassword: false,
                    icon: Icon(Icons.create, size: 20,color: Color(0xFFF032f41)),
                  ),
                  SizedBox(height: 10),
                  ButtonLoginAnimation(
                    label: "PAY",
                    background: Color(0xFF00cc00),
                    fontColor: Colors.white,
                    borderColor: Colors.white,
                    onTap: () async {
                      pr = new ProgressDialog(context,isDismissible: false);
                      pr.update(
                        progress: 40.0,
                        message: "Loading...",
                        progressWidget: Container(
                            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                        maxProgress: 100.0,
                        progressTextStyle: TextStyle(
                            color: Colors.black, fontSize: 9.0, fontWeight: FontWeight.w400),
                        messageTextStyle: TextStyle(
                            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
                      );
                      await pr.show();
                      await Provider.of<ApiService>(context, listen: false)
                          .payment(data.data, data.message, amount, "null", account, "null",
                          etAccount.text, etDescription.text, userid).then((it) async{
                          await pr.hide();
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.INFO,
                            body: Center(child: Text(
                              'Successfully!!!',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),),
                            tittle: 'This is Ignored',
                            desc:   'This is also Ignored',
                            btnOkOnPress: () async{
                              _navigateToHome();
                            },
                          ).show();
                      });
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
  void _navigateToHome(){
    Navigator.pop(context,true);// close button arrow back
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ContentScreen(),
          settings: RouteSettings()),
    );
  }
}