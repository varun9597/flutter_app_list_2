import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_list/controllers/bindings/authBinding.dart';
import 'package:flutter_app_list/utils/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initialize Firebase Application
  await Firebase
      .initializeApp(); // This needs to be done whenever Firebase is used.
  runApp(MyApp()); //Points to the below MyApp Class
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //GetMaterialApp is used when we us GetX for navigation
      initialBinding:
          AuthBinding(), //initialBinding is used to load the AuthBinding() function when the app starts to improve performance
      home: Root(), //Points to Root() method in root.dart
      theme: ThemeData.dark(),
    );
  }
}
