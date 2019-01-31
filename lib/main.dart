import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:driverapp/app_screens/root_page.dart';
import 'package:driverapp/app_screens/homepage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Login App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth()),
//      home:  HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



