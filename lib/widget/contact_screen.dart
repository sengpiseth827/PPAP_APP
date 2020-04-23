import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppapapp/components/customTextfield.dart';
import 'package:ppapapp/components/customTextfieldContact.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  CustomTextFieldContact(
                    controller: null,
                    label: "កែងមហាវិថីនរោត្តម និងផ្លូវលេខ​ ១០៦ រាជធានីភ្នំពេញ",
                    icon: Icon(Icons.location_on, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldContact(
                    controller: null,
                    label: "023 46 66 40",
                    icon: Icon(Icons.phone, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldContact(
                    controller: null,
                    label: "info@mpwt_gov.kh",
                    icon: Icon(Icons.email, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldContact(
                    controller: null,
                    label: "Facebook.com/mpwt_gov.kh",
                    icon: Icon(FontAwesomeIcons.facebook, size: 20,color: Color(0xFFF032f41),),
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldContact(
                    controller: null,
                    label: "www.mpwt_gov.kh",
                    icon: Icon(Icons.language, size: 20,color: Color(0xFFF032f41),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
