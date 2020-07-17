import 'package:flutter/material.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GreetingDetailScreen extends StatefulWidget {
  @override
  _GreetingDetailScreenState createState() => _GreetingDetailScreenState();
}

class _GreetingDetailScreenState extends State<GreetingDetailScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  double money = 50.00;

  @override
  void initState(){
    super.initState();
  }

  custom() {
    final CeoModel data = ModalRoute.of(context).settings.arguments;
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
            background: Image.network(
              "http://ppaptest.truckingcambodia.com/datacontroller/imgview.php?&img=ceogreeting.jpg",
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
                          data.nameTitle,
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
                          data.content,
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
      body: custom(),
    );
  }
}
