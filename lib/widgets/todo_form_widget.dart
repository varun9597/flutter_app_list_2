import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String content;
  final ValueChanged<String> onChangedContent;
  final VoidCallback onSavedTodo;
  const TodoFormWidget({
    Key key,
    this.content = '',
    @required this.onChangedContent,
    @required this.onSavedTodo,
  }) : super(key: key);

  Widget buildContent() {
    return TextFormField(
      decoration:
          InputDecoration(border: UnderlineInputBorder(), labelText: 'Content'),
      initialValue: content,
      onChanged: onChangedContent,
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.cyan),
      ),
      onPressed: onSavedTodo,
      child: Text('Save'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContent(),
          SizedBox(
            height: 5,
          ),
          buildButton(),
        ],
      ),
    );
  }
}
