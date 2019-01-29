import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/first_screen.dart' as first;
import 'package:driverapp/app_screens/second_screen.dart' as second;
import 'package:driverapp/app_screens/third_screen.dart' as third;


class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2>
    with SingleTickerProviderStateMixin {
  bool _value = false;
  final _open = 'พร้อมรับงาน';
  final _close = 'ไม่พร้อมรับงาน';

  bool _value1 = false;
  bool _value2 = false;

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: Container(
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Switch(
                      value: _value1,
                      onChanged: _onChanged,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            bottom: new TabBar(controller: controller, tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back))
            ])),
        bottomNavigationBar: new Material(
            color: Colors.deepOrange,
            child: new TabBar(controller: controller, tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back))
            ])),
        body: new TabBarView(controller: controller, children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ]));
  }
}
