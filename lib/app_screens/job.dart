import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/widgets.dart' as widgets; // note: external package imp

import 'dart:ui' as ui;


class Jobpage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
//    final double devicePixelRatio = ui.window.devicePixelRatio;
//    final ui.Size windowLogicalSize = ui.window.physicalSize / devicePixelRatio;
//    // Let us give the Painter full width and half of height.
//    final ui.Size logicalSize =
//    new Size(windowLogicalSize.width, windowLogicalSize.height / 2);
//
//    print(" ### Size: ui.window.physicalSize=${ui.window.physicalSize}, "
//        "windowLogicalSize=$windowLogicalSize,"
//        "logicalSize=$logicalSize");


    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Peter Maloack',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFD84315),
//        backgroundColor: Color(0xFFE64A19),
      ),
      body: Center(

        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            color: Colors.white,
            margin: new EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 8.0,
                animation: true,
                percent: 0.5,
                center: new Text(
                  "10 sec",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawChip(
                    label: Text('1.8 km'),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    Text(
                      'Wat Phra Singh - วัดพระสิงห์',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      'Singharat Road,  Mueang',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      ' Sri Phum, Mueang',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                        ),
                        Center(
                          child: new Container(
                            height: 40.0,
                            width: 40.0,
                            margin: const EdgeInsets.only(top: 15.0),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(50.0),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: new Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    Text(
                      'Chiangmai University - มหาวิทยาลัยเชียงใหม่',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      'Suthep Road, Huawkaew lane, Mueang, chiangmai',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawChip(
                    label: Text('168 THB'),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  )
                ],
              ),
              new Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: ButtonTheme(
                          height: 50.0,
                          child: RaisedButton(
                            child: new Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            color: Colors.green,
                            elevation: 10.0,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 5,
                        child: ButtonTheme(
                          height: 50.0,
                          child: RaisedButton(
                            child: new Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            color: Colors.red,
                            elevation: 10.0,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        ),

      ),
    );
  }

}
