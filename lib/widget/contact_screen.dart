import 'package:flutter/material.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Contact',
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
                child: Text("Something wrong"),
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
                leading: Image.network(tasks[index].imagePath),
                title: Text(tasks[index].nameTitle),
              ),
            ),
          );
        });
  }
}
