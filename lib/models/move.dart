import 'package:firebase_database/firebase_database.dart';

class Move {
  String key;
  String userId;
  String license_plate;
  double lat;
  double lng;
  double direction;
  bool status;

  Move(this.userId, this.license_plate, this.lat, this.lng, this.direction, this.status);

  Move.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        userId = snapshot.value["userId"],
        license_plate = snapshot.value["license_plate"],
        lat = snapshot.value["lat"],
        lng = snapshot.value["lng"],
        direction = snapshot.value["direction"],
        status = snapshot.value["status"];

  toJson() {
    return {
      "userId": userId,
      "license_plate": license_plate,
      "lat": lat,
      "lng": lng,
      "direction": direction,
      "status": status,
    };
  }
}