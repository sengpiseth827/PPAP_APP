import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

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
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      new Text("Exchange Rate",style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0,left: 20.0, right: 20.0),
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
                              hintText: "KHR",
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
                            hintText: "USD",
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