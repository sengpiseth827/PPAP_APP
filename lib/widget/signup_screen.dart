
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/screen/content_screen.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etConfirm = new TextEditingController();
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etFirstname = new TextEditingController();
  TextEditingController etLastname = new TextEditingController();
  TextEditingController etCompany = new TextEditingController();
  TextEditingController etPhonenumber = new TextEditingController();
  TextEditingController etAddress = new TextEditingController();
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Register',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(
                controller: etFirstname,
                label: "Firstname",
                icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etLastname,
                label: "Lastname",
                icon: Icon(Icons.person, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etCompany,
                label: "Company",
                icon: Icon(Icons.whatshot, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etPhonenumber,
                label: "Phone Number",
                icon: Icon(Icons.phone, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etEmail,
                label: "Email",
                icon: Icon(Icons.email, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etPassword,
                label: "Password",
                isPassword: true,
                icon: Icon(Icons.https, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: etConfirm,
                label: "Confirm Password",
                isPassword: true,
                icon: Icon(Icons.https, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 5),
              CustomTextField(
                controller: etAddress,
                label: "Address",
                isPassword: false,
                icon: Icon(Icons.contacts, size: 20,color: Color(0xFFF032f41),),
              ),
              SizedBox(height: 10),
              ButtonLoginAnimation(
                label: "Submit",
                background: Color(0xFF00cc00),
                fontColor: Colors.white,
                borderColor: Colors.white,
                onTap: () async {
                  if ( etConfirm.text == etPassword.text) {
                    await Provider.of<ApiService>(context, listen: false)
                        .postUser(
                        etPassword.text,
                        etFirstname.text,
                        etLastname.text,
                        etPhonenumber.text,
                        etEmail.text,
                        etCompany.text,
                        etAddress.text).then((it) async{
                          it.forEach((f) async {
                            prefs = await SharedPreferences.getInstance();
                            await prefs.setString('username', f.tel);
                            await prefs.setString('password', f.password);
                            await prefs.setString('token', f.sysId);
                            _navigateToHome(f.sysId);
                          });
                        });
                  }else{
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
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _navigateToHome(String id){
    Navigator.pop(context,true);// close button arrow back
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ContentScreen(),
          settings: RouteSettings(arguments: id)),
    );
  }
}