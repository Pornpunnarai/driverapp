import 'package:flutter/material.dart';
import 'package:driverapp/models/todo.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class First extends StatefulWidget {
  First({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _FirstState();
//  _FirstState createState() => _FirstState();

}



class _FirstState extends State<First> {


  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();


  GoogleMapController mapController;
  MapType _currentMapType = MapType.normal;

  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;
  bool _value = false;
  String _status = '';
//  final _close = 'ไม่พร้อมรับงาน';

  void _onChanged(bool value) {
    setState(() {
      if(value){
        _status = 'พร้อมรับงาน';
      }else{
        _status = 'ไม่พร้อมรับงาน';
      }

      print(value);
      _value = value;
      _todoList[0].completed = value;
      _updateTodo(_todoList[0]);

    });
  }

  Query _todoQuery;

  @override
  void initState() {
    super.initState();
    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
    .equalTo(widget.userId);
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(_onEntryAdded);
    _onTodoChangedSubscription = _todoQuery.onChildChanged.listen(_onEntryChanged);

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });

            mapController.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(
                    target: _currentLocation == null ? LatLng(0, 0) : LatLng(
                        _currentLocation["latitude"],
                        _currentLocation["longitude"]), zoom: 15.0)));

        });
  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
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

  _onEntryAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));

      _value = _todoList[0].completed;
            if(_value){
        _status = 'พร้อมรับงาน';
      }else{
        _status = 'ไม่พร้อมรับงาน';
      }
    });
  }

  _updateTodo(Todo todo){
    //Toggle completed
    if (todo != null) {
      _database.reference().child("todo").child(todo.key).set(todo.toJson());
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
//    refresh();

  }


  @override
  Widget build(BuildContext context) {




    assert (debugCheckHasMediaQuery(context));
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Switch(
                  value: _value,
                  onChanged: _onChanged,
                  activeColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(_status,
                  style: TextStyle(fontSize: 20.0, color: Colors.green)),
            ),
          ),
        ),
      ),
      body: Container(
        child: new Center(
//          child: new Text('Google Map Page', style : TextStyle(fontSize: 40.0, color: Colors.green)),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
                trackCameraPosition: true,
                cameraPosition:
                const CameraPosition(target: LatLng(0.0, 0.0),zoom: 15.0),
                myLocationEnabled: true
            ),
          ),
        ),
      ),
    );
  }
}
