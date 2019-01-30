import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/first_screen.dart' as first;
import 'package:driverapp/app_screens/second_screen.dart' as second;
import 'package:driverapp/app_screens/third_screen.dart' as third;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

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

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            bottomNavigationBar: new Material(
                color: Colors.redAccent,
                child:
                new TabBar(controller: controller, tabs: <Tab>[
                  new Tab(
                    icon: new Icon(Icons.home),
                    text: 'หน้าแรก',
                  ),
                  new Tab(
                    icon: new Icon(Icons.history),
                    text: 'ประวัติ',
                  ),
                  new Tab(
                    icon: new Icon(Icons.more),
                    text: 'เพิ่มเติม',
                  )
                ],
                    indicatorColor: Colors.white,
                    labelColor:Colors.black,
                    labelStyle:TextStyle(fontSize: 17.0),
                    unselectedLabelColor:Colors.white)),
            body: new TabBarView(controller: controller, children: <Widget>[
              new first.First(),
              new second.Second(),
              new third.Third()
            ]))
    );
  }
}
