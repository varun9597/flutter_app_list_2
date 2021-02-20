import 'package:flutter/material.dart';
import 'package:flutter_app_list/models/todo.dart';
import 'package:flutter_app_list/services/database.dart';

import 'package:flutter_app_list/widgets/todo_alert_dialog.dart';

class TodoCard extends StatelessWidget {
  final String uid;
  final TodoModel todo;

  const TodoCard({Key key, this.uid, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                child: Text(
                  todo.content,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Checkbox(
              value: todo.done,
              onChanged: (newValue) {
                Database().updateTodoCheckbox(newValue, uid, todo.todoId);
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  child: EditTodoDialogWidget(todo),
                  barrierDismissible: true,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
