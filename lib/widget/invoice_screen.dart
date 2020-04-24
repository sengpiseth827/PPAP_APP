import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/model/PdfViewPage.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  ProgressDialog pr;
  String urlPDFPath = "";
  TextEditingController etInvoice = new TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF0000b3),
          title: Text(
            'Invoice',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: new Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new  CustomTextField(
                  controller: etInvoice,
                  label: "Invoice Number",
                  icon: Icon(Icons.description, size: 27,color: Color(0xFFF032f41),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new  ButtonLoginAnimation(
                    label: "Search",
                    background: Colors.cyan,
                    fontColor: Colors.white,
                    borderColor: Colors.white,
                    onTap: () {
                      pr = new ProgressDialog(context);
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
                      pr.show();
                      Provider.of<ApiService>(context, listen: false).postqrcode(etInvoice.text).then((value){
                        print(value);
                        getFileFromUrl(value).then((f) {
                          urlPDFPath = f.path;
                          print(urlPDFPath);
                          if (urlPDFPath != null) {
                            pr.hide();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewPage(path: urlPDFPath)));
                          }
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
