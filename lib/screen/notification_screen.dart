import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
        ),
        title: Center(
          child: Text(
            'Notification',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              child: Image.asset(
                "assets/images/notification.jpg",
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
