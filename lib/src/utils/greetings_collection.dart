import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GreetingsCollection {
  GreetingsCollection();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection("greetings");

  Stream<QuerySnapshot> get fetch =>
      collection.orderBy("createdAt").snapshots();

  Future create(String name, String message) async {
    var time = DateTime.now().toUtc().toIso8601String();
    var uid = const Uuid().v4();
    return await collection
        .doc(uid)
        .set({
          "uid": uid,
          "name": name,
          "message": message,
          "createdAt": time,
        })
        .whenComplete(() => debugPrint("Item added to the database"))
        .catchError((e) => debugPrint("$e"));
  }
}
