import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_app_list/controllers/authController.dart';
import 'package:flutter_app_list/controllers/todoController.dart';
import 'package:flutter_app_list/controllers/userController.dart';
import 'package:flutter_app_list/services/database.dart';
import 'package:flutter_app_list/widgets/todo_card.dart';

class Home extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //GetX<UserController> calls the user controller to get the user name
        title: GetX<UserController>(
          //(_) is used to refer to the UserController since it has been called in GetX function above
          initState: (_) async {
            Get.find<UserController>().user =
                await Database().getUser(Get.find<AuthController>().user.uid);
          },
          builder: (_) {
            if (_.user.name != null) {
              return Text("Welcome " + _.user.name);
            } else {
              return Text("loading...");
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      //on pressing '+' code checks if text isn't null and adds new todos
                      if (_todoController.text != "") {
                        Database()
                            .addTodo(_todoController.text, controller.user.uid);
                        //clear is needed to avoid adding the same todos again
                        _todoController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
            init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              //Checks if todoController has any content
              if (todoController != null && todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (_, index) {
                      return TodoCard(
                          //return Todcard by checking the uid
                          uid: controller.user.uid,
                          todo: todoController.todos[index]);
                    },
                  ),
                );
              } else {
                return Text("Unable to load cards..");
              }
            },
          )
        ],
      ),
    );
  }
}
