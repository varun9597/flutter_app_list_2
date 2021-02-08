import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_app_list/controllers/userController.dart';
import 'package:flutter_app_list/models/user.dart';
import 'package:flutter_app_list/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //Rx is used to create a observable stream for a variable
  Rx<User> _firebaseUser = Rx<User>();

  //Getter is used here to get the value of FirebaseUser and stored in user
  User get user => _firebaseUser.value;

  @override
  //A GetXController has onInit(), onReady() & onClose()

  onInit() {
    //binding FirebaseUser variable to authStateChanges()
    //so that whenever authStateChanges(), our user variable is also updated
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      //create user in Firebase
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      //We create UserModel to pass it to the createNewUser method in Database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid, //return the user UID from Firebase
        name: name,
        email: _authResult.user.email,
      );
      //Passing user data in Database.dart
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        //Get.back() is used To close snackbars, dialogs, bottomsheets,
        Get.back();
      }
    } catch (e) {
      //Showing a snackbar if creating user fails
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      //return UserCredential from Firebase
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      //Stores the UID value in UserController,
      // so that this value is used whenever user related activity is performed
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      //.clear() is used to clear the UserController
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
