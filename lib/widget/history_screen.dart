import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/model/service_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/detail_screen.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Transferd History',
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
    return FutureBuilder<List<ServiceModel>>(
      future: Provider.of<ApiService>(context, listen: false).getService(),
      builder: (BuildContext context, AsyncSnapshot<List<ServiceModel>> snapshot) {
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

  ListView _listTasks({BuildContext context, List<ServiceModel> tasks}) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 8,left: 8,right: 8),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      "Transfered to ABA BANK",
                      style: TextStyle(color: Colors.black54,fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Transfer ID :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "121212121",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Pay for :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "INV9020939",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Original amount :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "250.0"+"\$",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "From account :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "001423955",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "To account :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "000454947",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Description :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "SENG PISETH",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Amount :",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "250.0"+"\$",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                )
              ),
            ),
          );
        });
  }
}
