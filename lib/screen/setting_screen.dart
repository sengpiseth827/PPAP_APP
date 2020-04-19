import 'package:flutter/material.dart';
import 'package:ppapapp/widget/contact_screen.dart';
import 'package:ppapapp/widget/profile_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  children: <Widget>[
                    new Text(
                      'កំពង់ផែស្វយ័តភ្នំពេញ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13
                      ),
                    ),
                    new Text(
                      'Phnom Penh Autonomous Port',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      new ListTile(
                          title: new Text("Profile"),
                          trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                          onTap: () {
                            Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProfileScreen()));
                          }
                      ),
                      new ListTile(
                          title: new Text("Setting"),
                          trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                          onTap: () {
                            Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProfileScreen()));
                          }
                      ),
                      new ListTile(
                          title: new Text("Contact Us"),
                          trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                          onTap: () {
                            Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ContactScreen()));
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
