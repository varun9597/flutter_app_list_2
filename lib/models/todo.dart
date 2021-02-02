import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  Timestamp dateCreated;
  bool done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoId = documentSnapshot.id;
    Map x = documentSnapshot.data();
    content = x["content"];
    print("Content" + content);
    dateCreated = x["dateCreated"];
    done = x["done"];
  }
}
