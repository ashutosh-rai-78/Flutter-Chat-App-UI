

import 'package:firebase_database/firebase_database.dart';

class Database{

  final ref = FirebaseDatabase.instance.ref("chats");

  /*ref.onChildAdded.listen((event) {
  // A new comment has been added, so add it to the displayed list.
  });*/

}