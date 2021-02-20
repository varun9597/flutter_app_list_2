import 'package:flutter/material.dart';
import 'package:flutter_app_list/controllers/userController.dart';
import 'package:flutter_app_list/models/todo.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/services/database.dart';
import 'package:flutter_app_list/controllers/todoController.dart';
import 'package:flutter_app_list/widgets/todo_form_widget.dart';

class EditTodoDialogWidget extends StatefulWidget {
  final String uid;
  final TodoModel todo;
  final String content;
  const EditTodoDialogWidget(this.todo, {Key key, this.uid, this.content})
      : super(key: key);

  @override
  _EditTodoDialogWidgetState createState() => _EditTodoDialogWidgetState();
}

class _EditTodoDialogWidgetState extends State<EditTodoDialogWidget> {
  String content = '';

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
                //onChangedContent: ,
                onChangedContent: (newContent) =>
                    setState(() => this.content = newContent),
                onSavedTodo: () {
                  String uid = Get.find<UserController>().user.id;

                  Get.find<TodoController>().todos.first;

                  Database()
                      .updateTodoContent(content, uid, widget.todo.todoId);
                }),
          ],
        ),
      );
}
