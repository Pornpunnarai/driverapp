import 'package:flutter/material.dart';
import 'package:driverapp/app_screens/loginpage.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:driverapp/app_screens/homepage.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:driverapp/models/move.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();


}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";



  Map<String, double> _currentLocation;
  double _direction;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();
  bool _permission = false;
  String error;



  List<Move> _moveList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  StreamSubscription<Event> _onMoveAddedSubscription;
  StreamSubscription<Event> _onMoveChangedSubscription;

  Query _moveQuery;


  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          initialDatabase(_userId);
        }
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });



    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });

          if(authStatus==AuthStatus.LOGGED_IN) {
            Move move = new Move(
                _userId, "test", _currentLocation["latitude"],
                _currentLocation["longitude"], _direction,
                true);
                            _database.reference().child("move").child(_userId).set(
                    move.toJson());
          }

        });


    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });

  }

  initialDatabase (String userId){
    _moveList = new List();
    _moveQuery = _database
        .reference()
        .child("move")
        .orderByChild("userId")
        .equalTo(userId);
    _onMoveAddedSubscription = _moveQuery.onChildAdded.listen(_onEntryAdded);
    _onMoveChangedSubscription = _moveQuery.onChildChanged.listen(_onEntryChanged);



  }

  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();


      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

//    setState(() {
//      _startLocation = location;
//    });

  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;

    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  void _onChangeStatus() {
    _moveList[0].status = !_moveList[0].status;
    if (_moveList[0] != null) {
      _database.reference().child("move").child(_userId).set(_moveList[0].toJson());
//      _moveList[0].status = !_moveList[0].status;
    }

    print("ssssssssssssssssssss");
  }

  _onEntryChanged(Event event) {
    var oldEntry = _moveList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _moveList[_moveList.indexOf(oldEntry)] = Move.fromSnapshot(event.snapshot);
    });
  }

  _onEntryAdded(Event event) {
    setState(() {
      _moveList.add(Move.fromSnapshot(event.snapshot));

    });
  }


  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginForm(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null &&_moveList.length  > 0) {
          return new HomeScreen(
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
              currentLocation:  _currentLocation,
              onChangeStatus: _onChangeStatus,
              status: _moveList[0].status
          );
        } else return _buildWaitingScreen();
        break;
      default:
        return _buildWaitingScreen();
    }
  }
}
