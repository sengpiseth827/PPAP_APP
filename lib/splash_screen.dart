import 'package:flutter/material.dart';
import 'package:ppapapp/screen/content_screen.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences sharedPreferences;

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToLogin();
          }
        }
    );
  }

  Future<bool> _mockCheckForSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Future.delayed(Duration(milliseconds: 3000), () {});
    if(sharedPreferences.getString("token") == null) {
      return false;
    }else {
      return true;
    }
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => ContentScreen()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              child: new Image.asset('assets/images/logo.jpg'),
            ),
            Container(
              child: Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xFF0000b3),
                highlightColor: Color(0xfffffff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12)
                          )
                        ]
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}