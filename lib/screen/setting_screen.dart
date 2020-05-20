import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/ChangeAddressDialog.dart';
import 'package:ppapapp/components/ChangePasswordDialog.dart';
import 'package:ppapapp/components/ChangeProfileDialog.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/history_screen.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:ppapapp/widget/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  SharedPreferences mySPrefs;
  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";
  SharedPreferences sharedPreferences;
  String username= "Username" ,phone = "00 000 000";

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
      String userId = sharedPreferences.getString("token");
      final api = Provider.of<ApiService>(context, listen: false);
      api.getUser().then((it)  {
        it.forEach((f) async {
          if(f.sysId == userId){
            setState(() {
              username = f.userName;
              phone = f.tel;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Container(
                  width: 40,
                  child: Image.asset("assets/images/logo.jpg")
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 50),
                      child: new Text(
                        'កំពង់ផែស្វយ័តភ្នំពេញ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11
                        ),
                      ),
                    ),
                    new Text(
                      'Phnom Penh Autonomous Port',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.notifications_active,color: Colors.black,),
            ),
          ],
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        username,
                        style: TextStyle(
                          color:  Color(0xFF0000b3),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage(otherProfilePic),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "(+855) "+phone,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50.0),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        new ListTile(
                          title: Text("History",style: TextStyle(fontSize: 16,color: Colors.black),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => HistoryScreen(),
                            );
                          },
                        ),
                        new ListTile(
                          title: Text("Change Password",style: TextStyle(fontSize: 16,color: Colors.black),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => ChangePasswordDialog(),
                            );
                          },
                        ),
                        SizedBox(height: 0.5,child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Container(color: Colors.black12,),
                        ),),
                        new ListTile(
                          title: Text("Change Address",style: TextStyle(fontSize: 16,color: Colors.black),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => ChangeAddressDialog(),
                            );
                          },
                        ),
                        SizedBox(height: 0.5,child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Container(color: Colors.black12,),
                        ),),
                        new ListTile(
                          title: Text("Change Profile",style: TextStyle(fontSize: 16,color: Colors.black),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => ChangeProfileDialog(),
                            );
                          },
                        ),
                        SizedBox(height: 0.5,child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Container(color: Colors.black12,),
                        ),),
                        new ListTile(
                          title: Text("Log Out",style: TextStyle(fontSize: 16,color: Colors.black),),
                          onTap: () async{
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.INFO,
                              body: Center(child: Text(
                                'Are you sure want to logout?',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),),
                              tittle: 'This is Ignored',
                              desc:   'This is also Ignored',
                              btnCancelOnPress: (){},
                              btnOkOnPress: () async{
                                SharedPreferences mySPrefs = await SharedPreferences.getInstance();
                                mySPrefs.remove("token");
                                mySPrefs.clear();
                                _navigateToLogin();
                              },
                            ).show();
                          },
                        ),
                        SizedBox(height: 0.5,child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Container(color: Colors.black12,),
                        ),),
                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()
        )
    );
  }
}
