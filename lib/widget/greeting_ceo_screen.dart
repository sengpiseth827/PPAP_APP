import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppapapp/components/loginbutton.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_screen.dart';
import 'greeting_detail_screen.dart';
import 'login_screen.dart';

class GreetingCEOScreen extends StatefulWidget {
  @override
  _GreetingCEOScreenState createState() => _GreetingCEOScreenState();
}

class _GreetingCEOScreenState extends State<GreetingCEOScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  double money = 50.00;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Greeting From CEO',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          )
      ),
      body: _listFutureTasks(context),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<List<CeoModel>>(
      future: Provider.of<ApiService>(context, listen: false).getCeo(),
      builder: (BuildContext context, AsyncSnapshot<List<CeoModel>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No Result"),
              ),
            );
          }
          final tasks = snapshot.data;
          return _listTasks(context: context, tasks: tasks);

        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
  ListView _listTasks({BuildContext context, List<CeoModel> tasks}) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.network("https://opendevelopmentcambodia.net/wp-content/uploads/sites/2/2016/07/Development-Policy-and-Administration.jpg"),
                title: Text(tasks[index].nameTitle),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context)=>new GreetingDetailScreen(),
                      settings: RouteSettings(arguments: tasks[index])
                  ));
                },
              ),
            ),
          );
        });
  }

//  Widget _listTasks({BuildContext context, CeoModel tasks}) {
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverAppBar(
//          backgroundColor: Color(0xFF0000b3),
//          expandedHeight: 200.0,
//          floating: false,
//          pinned: true,
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.favorite),
//              iconSize: 25.0,
//              color: Colors.white,
//              onPressed: (){
//
//              },
//            ),
//            IconButton(
//              icon: Icon(Icons.share),
//              iconSize: 25.0,
//              color: Colors.white,
//              onPressed: (){
//
//              },
//            ),
//          ],
//          flexibleSpace: FlexibleSpaceBar(
//            centerTitle: true,
//            title: Text(
//              "",
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 16.0,
//              ),
//            ),
//            background: Image.network(
//              "http://ppaptest.truckingcambodia.com/datacontroller/imgview.php?&img=ceogreeting.jpg",
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//        SliverToBoxAdapter(
//          child: SizedBox(
//            child: Center(
//              child: Container(
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Container(
//                        child: Text(
//                          tasks.nameTitle,
//                          textAlign: TextAlign.left,
//                          style: TextStyle(
//                            color: Colors.redAccent,
//                            fontSize: 25.0,
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Container(
//                        child: Text(
//                          tasks.content,
//                          style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 16.0,
//                          ),
//                        ),
//                      ),
//                    ),
//                    Container(
//                      height: MediaQuery.of(context).size.height,
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
}


