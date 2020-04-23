import 'package:flutter/material.dart';
import 'package:ppapapp/model/anouncement_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/anouncement_detail_screen.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class AnouncementScreen extends StatefulWidget {
  @override
  _AnouncementScreenState createState() => _AnouncementScreenState();
}

class _AnouncementScreenState extends State<AnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Anouncement',
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
    return FutureBuilder<List<AnouncementModel>>(
      future: Provider.of<ApiService>(context, listen: false).getAnouncement(),
      builder: (BuildContext context, AsyncSnapshot<List<AnouncementModel>> snapshot) {
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

  ListView _listTasks({BuildContext context, List<AnouncementModel> tasks}) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.network("https://translation100.com/wp-content/uploads/2019/04/Increase-potential-revenue.png"),
                title: Text(tasks[index].nameTitle),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>new AnouncementDetail(),
                      settings: RouteSettings(arguments: tasks[index])
                  ));
                },
              ),
            ),
          );
        });
  }
}
