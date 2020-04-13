
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "QR Invoice",
      subtitle: "March, Wednesday",
      img: "assets/images/qrcode.jpg");

  Items item2 = new Items(
    title: "Exchange Rate",
    subtitle: "Bocali, Apple",
    img: "assets/images/exchange.jpg",
  );
  Items item3 = new Items(
    title: "Anouncement",
    subtitle: "Lucy Mao going to Office",
    img: "assets/images/anouncement.jpg",
  );
  Items item4 = new Items(
    title: "Invoice",
    subtitle: "Rose favirited your Post",
    img: "assets/images/invoice.jpg",
  );
  Items item5 = new Items(
    title: "Our Services",
    subtitle: "Homework, Design",
    img: "assets/images/service.jpg",
  );
  Items item6 = new Items(
    title: "Greeting CEO",
    subtitle: "",
    img: "assets/images/greeting.jpg",
  );
  String currentProfilePic = "https://vignette.wikia.nocookie.net/corpsebride/images/9/99/Corpse-bride.jpg/revision/latest?cb=20120124015137";
  String otherProfilePic = "https://goodstransporter.com/wp-content/uploads/2019/11/Phnom-Penh-Autonomous-Port-PPAP.jpg";

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xfffffff;
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xfff5f5f0),
          height: 110,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 15),
                child: Column(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage(currentProfilePic),
                    ),
                    SizedBox(height: 10,),
                    new Text("Raksmey"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 25),
                child: Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          new Text("Company:   "),
                          new Text("company.com ,co.Ltd"),
                        ]
                    ),
                    Row(
                        children: <Widget>[
                          new Text("Email:   "),
                          new Text("mwg.sengrakmsey@gmail.com"),
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height-110,
          color: Colors.white,
          child: GridView.count(
              primary: false,
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 15, right: 15, top: 70),
              crossAxisCount: 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 60,
                        child: Image.asset(
                          data.img,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                );
              }).toList()),
        )
      ],
    );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  Items({this.title, this.subtitle, this.img});
}
