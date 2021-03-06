import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/components/customDialog.dart';
import 'package:ppapapp/screen/content_screen.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;
  SharedPreferences sharedPreferences;
  bool checked = false;

  Future _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => ContentScreen()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    print(data);
    final api = Provider.of<ApiService>(context, listen: false);
    api.getInvoice(data).then((it)  {
      setState(() {
        print("Invoice : ");
        print(it);
      });
    }).catchError((onError){
      print(onError.toString());
      checked = true;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0000b3),
        title: Text("Invoice" ,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14
        ),),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            label: Text("Payment"),
            onPressed: () async{
              sharedPreferences = await SharedPreferences.getInstance();
              if(sharedPreferences.getString("token") == null) {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
              }else {
                if(checked){
                  AwesomeDialog(
                    dismissOnTouchOutside: false,
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    body: Center(child: Text(
                      'This Invoice Number has been paid.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),),
                    tittle: 'This is Ignored',
                    desc:   'This is also Ignored',
                    btnCancelOnPress: (){},
                    btnOkOnPress: () async{},
                  ).show();
                }else{
                  showDialog(
                    context: context,
                    builder: (_) => PaymentDialog(data),
                  );
                }
              }
            },
          ),
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage+1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}