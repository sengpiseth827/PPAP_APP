import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              child: Image.asset(
                "assets/images/notitfication.jpg",
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Notification is empty',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,left: 100,right: 100,),
            )
          ],
        ),
      ),
    );
  }
}
