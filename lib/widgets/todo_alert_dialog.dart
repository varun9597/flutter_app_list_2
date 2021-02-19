import 'package:flutter/material.dart';
import 'package:flutter_app_list/controllers/userController.dart';
import 'package:flutter_app_list/models/todo.dart';
import 'package:flutter_app_list/models/user.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/services/database.dart';
import 'package:flutter_app_list/controllers/todoController.dart';
import 'package:flutter_app_list/widgets/todo_form_widget.dart';

class EditTodoDialogWidget extends StatefulWidget {
  final TodoModel todoModel;

  const EditTodoDialogWidget({Key key, this.todoModel}) : super(key: key);
  @override
  _EditTodoDialogWidgetState createState() => _EditTodoDialogWidgetState();
}

class _EditTodoDialogWidgetState extends State<EditTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String content = '';
  TodoModel todoModel;
  //TodoModel -todo = Get.find<TodoController>().todos.first;

  UserModel userModel;
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Modify Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TodoFormWidget(
                onChangedContent: (content) => setState(() => this.content),
                onSavedTodo: () {
                  String uid = Get.find<UserController>().user.id;
                  TodoModel todo = Get.find<TodoController>().todos.first;

                  Database().updateTodoContent(content, uid, todoModel.todoId);
                }),
          ],
        ),
      );
}
