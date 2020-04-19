import 'package:flutter/material.dart';
import 'package:ppapapp/model/service_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/detail_screen.dart';
import 'package:provider/provider.dart';

class OurServiceScreen extends StatefulWidget {
  @override
  _OurServiceScreenState createState() => _OurServiceScreenState();
}

class _OurServiceScreenState extends State<OurServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Our Service',
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
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.network("https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg"),
                title: Text(tasks[index].nameTitle),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>new DetailScreen(),
                  ));
                },
              ),
            ),
          );
        });
  }
}
