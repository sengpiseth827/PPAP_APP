import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/griddashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//    SharedPreferences sharedPreferences;
//  @override
//  void initState() {
//    super.initState();
//    checkLoginStatus();
//  }
//
//  checkLoginStatus() async {
//    sharedPreferences = await SharedPreferences.getInstance();
//    if(sharedPreferences.getString("token") == null) {
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
//    }
//  }
  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 90.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
              width: 150,
                child: Image.asset("assets/images/headerlogo.jpg")
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 5),
              child: GridDashboard(),
            )
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 5),
        child: GridDashboard(),
      ),
    );
  }
}
