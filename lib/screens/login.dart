import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/controllers/authController.dart';
import 'package:flutter_app_list/screens/signup.dart';

class Login extends GetWidget<AuthController> {
  //Whenever the user modifies a text field with an associated TextEditingController,
  // the text field updates value and the controller notifies its listeners.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                //TextFormField is a FormField that contains a text field
                //FormField maintains the current state and shows changes in values and validation errors visually
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                controller: passwordController,
                obscureText: true,
              ),
              RaisedButton(
                child: Text("Log In"),
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
              ),
              FlatButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Get.to(SignUp());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
