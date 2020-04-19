import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
        ),
        title: TextField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: null,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.all(16),
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              iconSize: 20,
              color: Colors.black,
              onPressed: () {},
            ),
            filled: true,
            fillColor: Colors.white38,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 0,
                  color: Colors.black
              ),
            ),
          ),
        ),
      ),
      body: _listFutureTasks(context),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              height: 100,
//              child: Image.asset(
//                "assets/images/resultsearch.jpg",
//                width: 100,
//                fit: BoxFit.cover,
//              ),
//            ),
//            SizedBox(height: 10,),
//            Text(
//              'No Result',
//              style: TextStyle(
//                color: Colors.black38,
//                fontSize: 18.0,
//                letterSpacing: 1.0,
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(top: 15,left: 100,right: 100,),
//            )
//          ],
//        ),
//      ),

    );
  }
  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
//      future: Provider.of<ApiService>(context, listen: false).getProduct(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
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

  ListView _listTasks({BuildContext context, List<ProductModel> tasks}) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
//                leading: Image.network(tasks[index].url),
                title: Text(tasks[index].userCode),
              ),
            ),
          );
        });
  }
}
