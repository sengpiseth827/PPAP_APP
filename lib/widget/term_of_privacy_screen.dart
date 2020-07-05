import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TermOfPrivacyScreen extends StatefulWidget {
  @override
  _TermOfPrivacyScreenState createState() => _TermOfPrivacyScreenState();
}

class _TermOfPrivacyScreenState extends State<TermOfPrivacyScreen> {

  ProgressDialog pr;
  String url = "http://ppaptest.truckingcambodia.com/TermPrivacy.html";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(backgroundColor: Color(0xFF0000b3),title: Text("Term Of Privacy")),
    );
  }
}
