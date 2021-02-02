import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/sign_in.dart';
import 'login_old.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Row(
          children: [
            Text(Get.arguments[0]),
            FlatButton(
                child: Text("Sign Out"),
                onPressed: () {
                  signOutGoogle();
                  Get.to(LoginPage());
                })
          ],
        ),
      )),
    );
  }
}
