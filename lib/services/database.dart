import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_list/models/todo.dart';
import 'package:flutter_app_list/models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore.collection("users").doc(uid).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
        print(retVal);
      });
      return retVal;
    });
  }

  Future<void> updateTodoCheckbox(
      bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateTodoContent(
      String newContent, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newContent});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
