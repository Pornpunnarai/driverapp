import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

import 'package:driverapp/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:driverapp/models/todo.dart';
import 'package:driverapp/app_screens/first_screen.dart' as first;
import 'package:driverapp/app_screens/second_screen.dart' as second;
import 'package:driverapp/app_screens/third_screen.dart' as third;

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;


  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

//  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;


  TabController controller;


  Query _todoQuery;


  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);

    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
//    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(_onEntryAdded);
    _onTodoChangedSubscription = _todoQuery.onChildChanged.listen(_onEntryChanged);

  }

  @override
  void dispose() {
//    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    controller.dispose();
    super.dispose();
  }


  _onEntryChanged(Event event) {
    var oldEntry = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] = Todo.fromSnapshot(event.snapshot);
    });
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
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
                    icon: new Icon(Icons.account_circle),
                    text: 'ข้อมูลส่วนตัว',
                  ),
                  new Tab(
                    icon: new Icon(Icons.history),
                    text: 'ประวัติ',
                  ),
                ],
                    indicatorColor: Colors.white,
                    labelColor:Colors.black,
                    labelStyle:TextStyle(fontSize: 17.0),
                    unselectedLabelColor:Colors.white)),
            body: new TabBarView(controller: controller, children: <Widget>[
              new first.First(),
              new third.Third(),
              new second.Second(),

            ]))
    );
  }
}