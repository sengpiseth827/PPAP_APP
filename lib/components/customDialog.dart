import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppapapp/model/ScreenArguments.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/widget/ABAPay_screen.dart';
import 'package:ppapapp/widget/FTBPay_screen.dart';
import 'package:ppapapp/widget/WingPay_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'customTextfieldPayment.dart';

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  String title="",khmer="",usd="";

  @override
  void initState() {
    super.initState();
    setState(() {
      getExchangeRateInfo();
    });

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }
  getExchangeRateInfo() async {
    final api = Provider.of<ApiService>(context, listen: false);
    api.getexchangerate().then((it)  {
      print(it);
      it.forEach((f) async {
        setState(() {
          title = f.nameTitle;
          khmer = f.kH;
          usd = f.uSD;
        });
      });
    }).catchError((onError){
      print(onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0,bottom: 10),
              child: Container(
                  width: 220,
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      new Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0,left: 15.0, right: 15.0),
                        child: new TextField(
                          readOnly: true,
                          style: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 10),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0)
                              ),
                              hintText: "KHR : "+khmer,
                              hintStyle: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 10),
                              suffixIcon: Container(
                                margin: EdgeInsets.only(right: 10),
                                  height: 10,
                                  child: Image.asset("assets/images/khmer.jpg")
                              ),
                          ),

                        ),
                      ),
                      new Icon(Icons.cached),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: new TextField(
                          readOnly: true,
                          style: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 10),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0)
                            ),
                            hintText: "USD : "+usd,
                            hintStyle: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 10),
                            suffixIcon: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 10,
                                child: Image.asset("assets/images/us.jpg")
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentDialog extends StatefulWidget {

  String data;
  PaymentDialog(this.data);

  @override
  State<StatefulWidget> createState() => PaymentDialogState(data);
}

class PaymentDialogState extends State<PaymentDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  String data;
  PaymentDialogState(String data) {
    this.data = data;
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("Dialog :"+data);
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
              child: Container(
                width: 200,
                height: 270,
                child: Column(
                  children: <Widget>[
                    new Text("Please choose the bank",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 15),
                    CustomTextFieldPayment(
                      controller: null,
                      label: "FTB",
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/ftb.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () async {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=>new FTBPayScreen(),
                            settings: RouteSettings(arguments: ScreenArguments(data,"FTB"))
                        ));
//                        String url = "https://apps.apple.com/kh/app/ftb-mohabot-app/id1248167629";
//                        if (await canLaunch(url)) {
//                          await launch(url,
//                              forceWebView: true
//                          );
//                          print(url);
//                        } else {
//                          print('Could not launch $url');
//                        }
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFieldPayment(
                      controller: null,
                      label: "ABA",
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/aba.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () async {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=>new ABAPayScreen(),
                            settings: RouteSettings(arguments: data)
                        ));
//                        String url = "https://apps.apple.com/kh/app/aba-mobile-bank/id968860649";
//                        if (await canLaunch(url)) {
//                          await launch(url,
//                              forceWebView: true
//                          );
//                          print(url);
//                        } else {
//                          print('Could not launch $url');
//                        }
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFieldPayment(
                      controller: null,
                      label: "Wing",
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/wing.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () async {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=>new WingPayScreen(),
                            settings: RouteSettings(arguments: data)
                        ));
//                        String url = "https://apps.apple.com/kh/app/wing-money/id1113286385";
//                        if (await canLaunch(url)) {
//                          await launch(url,
//                              forceWebView: true
//                          );
//                          print(url);
//                        } else {
//                          print('Could not launch $url');
//                        }
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}