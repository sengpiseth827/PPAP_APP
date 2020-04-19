import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/screen/notification_screen.dart';
import 'package:ppapapp/screen/search_screen.dart';
import 'package:ppapapp/screen/setting_screen.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {

  SharedPreferences sharedPreferences;

  int _selectIndex = 0;
  Widget CallPage(int index){
    switch(index){
      case 0: return HomeScreen();
      case 1: return SearchScreen();
      case 2: return NotificationScreen();
      case 3: return SettingScreen();
        break;
        default: return HomeScreen();
    }
  }
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
  String currentProfilePic = "https://vignette.wikia.nocookie.net/corpsebride/images/9/99/Corpse-bride.jpg/revision/latest?cb=20120124015137";
  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CallPage(_selectIndex),
//      drawer: new Drawer(
//        child: new ListView(
//          children: <Widget>[
//            new UserAccountsDrawerHeader(
//              accountEmail: new Text("mwg.sengraksmey@gmail.com"),
//              accountName: new Text("Raksmey"),
//              currentAccountPicture: new GestureDetector(
//                child: new CircleAvatar(
//                  backgroundImage: new NetworkImage(currentProfilePic),
//                ),
//                onTap: () => print("This is your current account."),
//              ),
//              otherAccountsPictures: <Widget>[
//                new GestureDetector(
//                  child: new CircleAvatar(
//                    backgroundImage: new NetworkImage(otherProfilePic),
//                  ),
////                  onTap: () => switchAccounts(),
//                ),
//              ],
//              decoration: new BoxDecoration(
//                  image: new DecorationImage(
//                      image: new NetworkImage("https://cne.wtf/wp-content/uploads/2019/01/06-01-2017-02-01-rand-1304134062.jpg"),
//                      fit: BoxFit.fill
//                  )
//              ),
//            ),
//            new ListTile(
//                title: new Text("Profile"),
//                trailing: new Icon(Icons.arrow_right),
//                onTap: () {
//                  Navigator.of(context).pop();
////                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
//                }
//            ),
//            new ListTile(
//                title: new Text("Setting"),
//                trailing: new Icon(Icons.arrow_right),
//                onTap: () {
//                  Navigator.of(context).pop();
////                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
//                }
//            ),
//            new ListTile(
//                title: new Text("Contact Us"),
//                trailing: new Icon(Icons.arrow_right),
//                onTap: () {
//                  Navigator.of(context).pop();
////                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
//                }
//            ),
//            new Divider(),
//            new ListTile(
//              title: new Text("Version"),
//              onTap: () => Navigator.pop(context),
//            ),
//          ],
//        ),
//      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Color(0xFF0000b3),
        currentIndex: _selectIndex,
        onTap: (value){
          _selectIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items:[
          new BottomNavigationBarItem(
            icon: _selectIndex == 0?new Icon(Icons.home,color:  Colors.yellowAccent): new Icon(Icons.home,color:  Colors.white),
            title: Text('Home',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 1?new Icon(Icons.search,color:  Colors.yellowAccent): new Icon(Icons.search,color:  Colors.white),
            title: Text('Search',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 2?new Icon(Icons.notifications_none,color:  Colors.yellowAccent): new Icon(Icons.notifications_none,color:  Colors.white),
            title: Text('Notification',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
          new BottomNavigationBarItem(
            icon: _selectIndex == 3?new Icon(Icons.settings,color:  Colors.yellowAccent): new Icon(Icons.settings,color:  Colors.white),
            title: Text('Setting',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
        ],
      ),
    );
  }
}
