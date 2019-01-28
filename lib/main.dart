import 'package:driverapp/app_screens/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Driver",
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title:Text('Driver'),),
      body: LoginPage(),
    ),
  ));
}

//Widget getListView() {
//  var listView = ListView(
//    children: <Widget>[
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text('Landscape'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//        onTap: (){
//          debugPrint('Tapped');
//        },
//      ),
//      ListTile(
//        leading: Icon(Icons.label_important),
//        title: Text('Window'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text('Phone'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text('Phone'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text('Phone'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text('Phone'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.phone),
//        title: Text('Phone'),
//        subtitle: Text('Beautiful View!'),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//
//      Text('another element in list'),
//      Container(color: Colors.blueGrey, height: 30.0,)
//    ],
//  );
//
//  return listView;
//}
