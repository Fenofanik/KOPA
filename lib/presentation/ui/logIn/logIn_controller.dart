
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/firebase.dart';
import 'package:kopamain/data/services/facebook_service.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  bool showText = true;
  Rx<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  int showBottomTextFields = 1;
  bool isPhone = false;
  bool isFaceBook = false;
  bool isGoogle = false;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }



  UserModel currentUser = UserModel();

  @override
  void onReady() {
    loading = false;
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }


  Future<void> faceSignIn() async{
    final FacebookLogin facebookSignIn = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    final String token = result.accessToken.token;
    loading = true;
    try{
      await FaceBookService().signIn(token).then((result) async{
        currentUser = result;
        update();
        final facebookAuthCredential = FacebookAuthProvider.credential(token);
      await FirebaseServices().firebaseAuth
           .signInWithCredential(facebookAuthCredential).then((result) {
          currentUser.id = result.user.uid;
          currentUser.email = result.user.email;
          currentUser.firstName = result.user.displayName;
          currentUser.image = result.user.photoURL;
          currentUser.favorite = [];
          FirebaseServices().userRef.doc(currentUser.id).set({
            "id": currentUser.id,
            "name":currentUser.firstName,
            "favs":currentUser.favorite,
            "phoneNumber": currentUser.email,
            "imageUrl":currentUser.image,

          });
          print("FACE BOOK USER================================>: ${currentUser.id}");
          print("FACE BOOK USER================================>: ${currentUser.firstName}");
          print("FACE BOOK USER================================>: ${currentUser.image}");
          print("FACE BOOK USER================================>: ${currentUser.email}");
          print("FACE BOOK USER================================>: ${currentUser.favorite}");
       });

        if(result == null){
          loading = true;
          update();
        }else{
          Get.toNamed(Routes.NavigationScreen);
        }
      });
    }catch(e){
      print(e);
    }
  }

  setInitialScreen(User user) {
    if (user == null) {
      Get.toNamed(Routes.LogIn);
    } else {
    }
  }
  void signIn() async {
    try {
      // showLoading();
      await auth
          .signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _initializeUserModel(_userId);
        clearControllers();
        // Get.toNamed(Routes.PartnersADD);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "", "",
        titleText: Align(
            alignment: Alignment.center,
            child: Text("Sign In Failed",style: TextStyle(color: whiteThings),)),
        messageText: Align(
            alignment: Alignment.center,child: Text("Try again",style: TextStyle(color: whiteThings))),
        duration: Duration(seconds: 3),
        // backgroundColor: secondAppBarBackground,
        // colorText: colorWhite,
      );
    }
  }

  void signUp() async {
    // showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);

        // Get.offAndToNamed(Routes.PartnersADD);
        clearControllers();
      });
    } catch (e) {
      // signIn();
      debugPrint(e.toString());
      Get.snackbar(
          "Sign In Failed", "Try again",
          duration: Duration(seconds: 3),
          // backgroundColor: colorBlue,
          // colorText: colorWhite
      );
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
        {"password": password.text.trim(),"id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  clearControllers() {
    email.clear();
    password.clear();
  }

// void reg() async {
//       final userCredential = await firebaseAuth.signInWithEmailAndPassword(
//         email: controllerEmail.value.text.trim(),
//         password: controllerPassword.value.text.trim(),
//       ).then((result) {
//         String _userId = result.user.uid.trim();
//         String _email = result.user.email.trim();
//         userRef.add({
//           'id': _userId,
//           'email': _email,
//         });
//       });
//       if (userCredential?.user != null) {
//         Get.offAndToNamed(Routes.PartnersADD);
//       }else Get.defaultDialog(
//         title: "DAFAQ"
//       );
//
// }
//
// void logIn() async {
//   try {
//     final userCredential = await firebaseAuth.signInWithEmailAndPassword(
//       email: controllerEmail.value.text,
//       password: controllerPassword.value.text,
//     );
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//     }
//   }
// }
//
// void signOut() async {
//   await FirebaseAuth.instance.signOut();
// }

// @override
// void onInit() {
//   controllerEmail = TextEditingController();
//   controllerPassword = TextEditingController();
//   super.onInit();
// }
//
// @override
// void dispose() {
//   controllerEmail.dispose();
//   super.dispose();
// }
}