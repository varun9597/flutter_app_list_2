import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/controllers/authController.dart';
import 'package:flutter_app_list/controllers/userController.dart';
import 'package:flutter_app_list/screens/home.dart';
import 'package:flutter_app_list/screens/login.dart';

class Root extends GetWidget<AuthController> {
  //GetWidget is used to cache a controller
  @override
  Widget build(BuildContext context) {
    //BuildContext is a handle to the location of a widget in a widget tree
    return GetX(
      //GetX is a reactive state manager
      initState: (_) async {
        // (_) is used when the context argument in the builder is not used
        Get.put<UserController>(
            UserController()); // here, we instantiate the class using get.put() so that it is available for all child routes
      },
      builder: (_) {
        //Get.find is used to find a controller that is being used by another page and redirect you to it
        if (Get.find<AuthController>().user?.uid != null) {
          //when user.uid is not null, it goes to the Home.dart page
          return Home();
        } else {
          //else takes to the login page
          return Login();
        }
      },
    );
  }
}
