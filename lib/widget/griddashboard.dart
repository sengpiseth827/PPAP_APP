import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:ppapapp/components/customDialog.dart';
import 'package:ppapapp/widget/anouncement_screen.dart';
import 'package:ppapapp/widget/contact_screen.dart';
import 'package:ppapapp/widget/greeting_ceo_screen.dart';
import 'package:ppapapp/widget/invoice_screen.dart';
import 'package:ppapapp/widget/our_service_screen.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "QR Invoice",
      subtitle: "March, Wednesday",
      img: "assets/images/QR.png");

  Items item2 = new Items(
    title: "Exchange Rate",
    subtitle: "Bocali, Apple",
    img: "assets/images/Rate.png",
  );
  Items item3 = new Items(
    title: "Anouncement",
    subtitle: "Lucy Mao going to Office",
    img: "assets/images/AN.png",
  );
  Items item4 = new Items(
    title: "Invoice",
    subtitle: "Rose favirited your Post",
    img: "assets/images/INV.png",
  );
  Items item5 = new Items(
    title: "Our Services",
    subtitle: "Homework, Design",
    img: "assets/images/Service.png",
  );
  Items item6 = new Items(
    title: "Greeting From CEO",
    subtitle: "",
    img: "assets/images/ceo.jpg",
  );
  Items item7 = new Items(
    title: "Contact Us",
    subtitle: "",
    img: "assets/images/tel.jpg",
  );
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      result = qrResult;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        result = "Camera permission was denied";
      } else {
        result = "Unknown Error $ex";
      }
    } on FormatException {
      result = "You pressed the back button before scanning anything";
    } catch (ex) {
      result = "Unknown Error $ex";
    }
    print("Result : "+result);
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item7];
    var color = 0xfffffff;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: GridView.count(
          primary: false,
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 15, right: 15, top: 30),
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 25,
          children: myList.map((data) {
            return Container(
              padding: EdgeInsets.all(1),
              child: new Hero(
                tag: data.title,
                child: new Material(
                  child: new InkWell(
                  onTap: (){
                    if(data.title == "QR Invoice"){
                      _scanQR();
                    }else if(data.title == "Exchange Rate"){
                      showDialog(
                          context: context,
                          builder: (_) => FunkyOverlay(),
                      );
                    }else if(data.title == "Anouncement"){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new AnouncementScreen(),
                      ));
                    }else if(data.title == "Invoice"){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new InvoiceScreen(),
                      ));
                    }else if(data.title == "Our Services"){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new OurServiceScreen(),
                      ));
                    }else if(data.title == "Greeting CEO"){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new GreetingCEOScreen(),
                      ));
                    }else if(data.title == "Contact Us"){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new ContactScreen(),
                      ));
                    }
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                child: Image.asset(
                                  data.img,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                data.title,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  Items({this.title, this.subtitle, this.img});
}
