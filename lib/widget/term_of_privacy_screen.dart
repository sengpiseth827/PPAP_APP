import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/model/PdfViewPage.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TermOfPrivacyScreen extends StatefulWidget {
  @override
  _TermOfPrivacyScreenState createState() => _TermOfPrivacyScreenState();
}

class _TermOfPrivacyScreenState extends State<TermOfPrivacyScreen> {

  ProgressDialog pr;
  String url = "http://ppaptest.truckingcambodia.com/TermPrivacy.php";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(backgroundColor: Color(0xFF0000b3),title: Text("Term Of Privacy")),
    );
  }
}
