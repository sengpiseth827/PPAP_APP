import 'package:flutter/material.dart';
import 'package:ppapapp/components/buttonLoginAnimation.dart';
import 'package:ppapapp/components/customTextfield.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  TextEditingController etInvoice = new TextEditingController();
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
                    onTap: () async {
//                        await Provider.of<ApiService>(context, listen: false).Login(etInvoice.text.toString());
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
