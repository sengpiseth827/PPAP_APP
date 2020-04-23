import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppapapp/components/loginbutton.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_screen.dart';
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

  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xFF0000b3),
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            background: Image.asset(
              "assets/images/crane.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Message from H.E Chairman & CEO",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "I would like to express my sincere thanks for your visit and a warm welcome to our website. PPAP is an international port, "
                              "located in the capital of Cambodia reachable by road, rail, and river. Its location is not only advantageous for inter-model"
                              " transportation connection but also for the logistics centre where more than 50% of cargoes are consumed. PPAP plays a "
                              "significant role in social development by providing more than 500 direct jobs and thousands of indirect jobs to Cambodian "
                              "people.\r\n\r\nFurthermore, our port can help shipping companies to reduce lead time, with the low transportation cost, "
                              "Cambodia trade also has a chance to challenge in the international market as well. We have been investing in our employees, "
                              "IT system and other port facilities to absorb more cargoes to our port. Likewise, we will completely modernize our handling "
                              "facilities to meet steadily increasing customer demand, which is our core business plan. As a result of this last five years "
                              "from 2014 to 2018, we keep our port annually increased at an average of 14.09%.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listFutureTasks(context),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<CeoModel>(
      future: Provider.of<ApiService>(context, listen: false).getCeo(),
      builder: (BuildContext context, AsyncSnapshot<CeoModel> snapshot) {
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

  Widget _listTasks({BuildContext context, CeoModel tasks}) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xFF0000b3),
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            background: Image.asset(
              "assets/images/crane.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          tasks.nameTitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          tasks.content,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


