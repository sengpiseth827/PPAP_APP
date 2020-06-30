import 'dart:async';
import 'dart:io';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ppapapp/components/customDialog.dart';
import 'package:ppapapp/model/PdfViewPage.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/anouncement_screen.dart';
import 'package:ppapapp/widget/contact_screen.dart';
import 'package:ppapapp/widget/greeting_ceo_screen.dart';
import 'package:ppapapp/widget/invoice_screen.dart';
import 'package:ppapapp/widget/our_service_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GridDashboard extends StatelessWidget {
  String urlPDFPath = "";
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
  ProgressDialog pr;

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  Future _scanQR(BuildContext context) async {
    pr = new ProgressDialog(context,isDismissible: false);
    pr.update(
      progress: 40.0,
      message: "Loading...",
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 9.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
    );
    try {
      String qrResult = await BarcodeScanner.scan();
      result = qrResult;
      print("Result : "+result);
      if(result.isNotEmpty && result != null){
        await pr.show();
        Provider.of<ApiService>(context, listen: false).postqrcode(result).then((value){
          print(value);
          getFileFromUrl(value).then((f) {
            urlPDFPath = f.path;
            print(urlPDFPath);
            if (urlPDFPath != null) {
              pr.hide();
              Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewPage(path: urlPDFPath),settings: RouteSettings(arguments: result)));
            }
          });
        });
      }
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
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item7];
    var color = 0xfffffff;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
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
                      _scanQR(context);
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
                    }else if(data.title == "Greeting From CEO"){
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
