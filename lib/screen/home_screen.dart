import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/griddashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentProfilePic = "https://vignette.wikia.nocookie.net/corpsebride/images/9/99/Corpse-bride.jpg/revision/latest?cb=20120124015137";
  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";
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
                      fontSize: 11
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              color: Colors.white,
//              color: Color(0xfff5f5f0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 15),
                    child: Column(
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundImage: new NetworkImage(currentProfilePic),
                        ),
                        SizedBox(height: 10,),
                        new Text("Raksmey"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 25),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 37),
                          child: Row(
                              children: <Widget>[
                                new Text("Company:   "),
                                new Text("company.com ,co.Ltd"),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                              children: <Widget>[
                                new Text("Email:   "),
                                new Text("mwg.sengrakmsey@gmail.com"),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.1,),
            Container(
              child: GridDashboard(),
            )
          ],
        ),
      )
    );
  }
}
