import 'package:flutter/material.dart';
import 'package:driverapp/models/todo.dart';
import 'package:driverapp/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:flutter/services.dart';



class First extends StatefulWidget {
  First({Key key, this.auth, this.userId, this.currentLocation,this.onChangeStatus,this.status})
      : super(key: key);

  final BaseAuth auth;
  final String userId;
  final Map<String, double> currentLocation;
  final VoidCallback onChangeStatus;
  final bool status;

  @override
  State<StatefulWidget> createState() => new _FirstState();

}



class _FirstState extends State<First> {




//
  GoogleMapController mapController;

  bool _value = false;
  String _status = '';


  void _onChanged(bool value) {
    setState(() {
      _value = value;
      widget.onChangeStatus();
      if(value){
        _status = 'พร้อมรับงาน';
      }else{
        _status = 'ไม่พร้อมรับงาน';
      }


    });
  }



  @override
  void initState() {
    super.initState();
    _value = widget.status;
    if(widget.status){
      _status = 'พร้อมรับงาน';
    }else{
      _status = 'ไม่พร้อมรับงาน';
    }
  }



  void _onMapCreated (GoogleMapController controller) async {
    mapController = controller;

    mapController.moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: widget.currentLocation == null ? LatLng(0,0) : LatLng(
                widget.currentLocation["latitude"],
                widget.currentLocation["longitude"]), zoom: 15.0)));
//    refresh();
  }


  @override
  Widget build(BuildContext context) {
    print(widget.currentLocation);


    assert (debugCheckHasMediaQuery(context));
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 8.0),
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
//      body: Container(
//        child: new Center(
////          child: new Text('Google Map Page', style : TextStyle(fontSize: 40.0, color: Colors.green)),
//          child: GoogleMap(
//            onMapCreated: _onMapCreated,
//            options: GoogleMapOptions(
//                trackCameraPosition: true,
//                cameraPosition:
//                const CameraPosition(target: LatLng(0.0, 0.0),zoom: 15.0),
//              myLocationEnabled: true,
//            ),
//          ),
//        ),
//      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              trackCameraPosition: true,
                cameraPosition:
                const CameraPosition(target: LatLng(0.0, 0.0),zoom: 15.0),
//              cameraPosition: CameraPosition(
//                target: LatLng(_startLocation["latitude"],_startLocation["longitude"]),
//                  zoom: 15.0
//              ),
              myLocationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
