import 'package:firebase_database/firebase_database.dart';

class RTModel {
  final String email;
  final String message;
  final int timestamp;

  RTModel(this.email, this.message, this.timestamp);

  factory RTModel.fromSnanpshot(DataSnapshot snapshot) {
    return RTModel(
        snapshot.child("from").value.toString(),
        snapshot.child("message").value.toString(),
        snapshot.child("timestamp").value as int);
  }
/*static RTModel fromSnanpshot(DataSnapshot snapshot){
    return RTModel(snapshot.child("from").value.toString(), message, timestamp)
  }*/
}
