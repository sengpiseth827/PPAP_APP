import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/griddashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";
  SharedPreferences sharedPreferences;
  String username= "Username" , email = "example@gmail.com",company = "Company";

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }
  getUserInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null) {
      String userId = sharedPreferences.getString("token");
      final api = Provider.of<ApiService>(context, listen: false);
      api.getUser().then((it)  {
        it.forEach((f) async {
          if(f.sysId == userId){
           setState(() {
             username = f.userName;
             email = f.email;
             company = f.company;
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          child: new CircleAvatar(
                            backgroundImage: new NetworkImage(otherProfilePic),
                          ),
                        ),
                        SizedBox(height: 10,),
                        new Text(username),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30,left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 37),
                          child: Row(
                              children: <Widget>[
                                new Text("Company :   "),
                                new Text(company),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                              children: <Widget>[
                                new Text("Email :   "),
                                new Text(email),
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
