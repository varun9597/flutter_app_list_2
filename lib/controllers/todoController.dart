import 'package:get/get.dart';
import 'package:flutter_app_list/controllers/authController.dart';
import 'package:flutter_app_list/controllers/bindings/authBinding.dart';
import 'package:flutter_app_list/models/todo.dart';
import 'package:flutter_app_list/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}
