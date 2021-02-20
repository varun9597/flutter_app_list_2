import 'package:flutter/material.dart';

import 'package:flutter_app_list/models/todo.dart';

class EditTodoContentFul extends StatefulWidget {
  final String uid;
  final TodoModel todo;
  final String content;
  const EditTodoContentFul(this.todo, {Key key, this.uid, this.content})
      : super(key: key);
  @override
  _EditTodoContentFulState createState() => _EditTodoContentFulState();
}

class _EditTodoContentFulState extends State<EditTodoContentFul> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Content'),
            initialValue: widget.todo.content,
          ),
          // TodoFormWidget(
          //     onChangedContent: (content) => setState(() => this.content),
          //     onSavedTodo: () {
          //       String uid = Get.find<UserController>().user.id;
          //
          //       Get.find<TodoController>().todos.first;
          //
          //       Database().updateTodoContent(content, uid, todoModel.todoId);
          //     }),
        ],
      ),
    );
  }
}

// class EditTodoContent extends StatelessWidget {
//   final String uid;
//   final TodoModel todo;
//   final String content;
//   const EditTodoContent(this.todo, {Key key, this.uid, this.content})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Modify Todo',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//                 border: UnderlineInputBorder(), labelText: 'Content'),
//             initialValue: todo.content,
//           ),
//           // TodoFormWidget(
//           //     onChangedContent: (content) => setState(() => this.content),
//           //     onSavedTodo: () {
//           //       String uid = Get.find<UserController>().user.id;
//           //
//           //       Get.find<TodoController>().todos.first;
//           //
//           //       Database().updateTodoContent(content, uid, todoModel.todoId);
//           //     }),
//         ],
//       ),
//     );
//   }
// }
