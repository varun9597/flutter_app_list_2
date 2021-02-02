import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  String name;

  UserModel({this.id, this.name, this.email});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot["email"];
    name = documentSnapshot["name"];
  }
}
