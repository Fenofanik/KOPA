import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopamain/core/constant/firebase.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/data/services/facebook_service.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';

class LoginController extends GetxController {
  bool showText = true;
  Rx<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  int showBottomTextFields = 1;

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

    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
    super.onReady();
  }

  Future<void> faceSignIn() async {
    final FacebookLogin facebookSignIn = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    final String token = result.accessToken.token;
    loading = true;
    try {
      await FaceBookService().signIn(token).then((result) async {
        currentUser = result;
        update();
        final facebookAuthCredential = FacebookAuthProvider.credential(token);
        await FirebaseServices()
            .firebaseAuth
            .signInWithCredential(facebookAuthCredential)
            .then((result) {
          currentUser.id = result.user.uid;
          currentUser.email = result.user.email;
          currentUser.firstName = result.user.displayName;
          currentUser.image = result.user.photoURL;
          currentUser.favorite = [];
          FirebaseServices().userRef.doc(currentUser.id).set({
            "id": currentUser.id,
            "name": currentUser.firstName,
            "favs": currentUser.favorite,
            "phoneNumber": currentUser.email,
            "imageUrl": currentUser.image,
          });
        });
        if (result == null) {
          Get.snackbar('Error to signIn with', 'META');
          update();
        } else {
          Get.toNamed(Routes.NavigationScreen);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future<void> googleLogIn() async {
    loading = true;
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((result) {
      currentUser.id = result.user.uid;
      currentUser.email = result.user.email;
      currentUser.image = result.user.photoURL;
      currentUser.favorite = [];
      currentUser.firstName = result.user.displayName;
      currentUser.phone = result.user.phoneNumber;
      FirebaseServices().userRef.doc(currentUser.id).set({
        "id": currentUser.id,
        "favs": currentUser.favorite,
        "phoneNumber": currentUser.email,
        "imageUrl": currentUser.image,
        'name': currentUser.firstName
      }).then((value) => Get.offAndToNamed(Routes.NavigationScreen));
    });
    update();
  }

  setInitialScreen(User user) {
    if (user == null) {
      Get.toNamed(Routes.LogIn);
    } else {
      // Get.toNamed(Routes.NavigationScreen);
    }
  }

  void signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _initializeUserModel(_userId);
        clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "", "",
        titleText: Align(
            alignment: Alignment.center,
            child: Text(
              "Sign In Failed",
              style: buildThemeData().textTheme.headline2,
            )),
        messageText: Align(
            alignment: Alignment.center,
            child: Text("Try again", style: buildThemeData().textTheme.headline2)),
        duration: const Duration(seconds: 3),
        // backgroundColor: secondAppBarBackground,
        // colorText: colorWhite,
      );
    }
  }

  void signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
        clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Sign In Failed", "Try again",
        duration: const Duration(seconds: 3),
        // backgroundColor: colorBlue,
        // colorText: colorWhite
      );
    }
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "password": password.text.trim(),
      "id": userId,
      "email": email.text.trim()
    });
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
}
