import 'dart:math';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Center(
        child: Text(yourLuckNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 40.0),),
      ),
    );
  }


  String yourLuckNumber(){
    var random = Random();
    int luckyNumber = random .nextInt(10);
    return '$luckyNumber';
  }
}
