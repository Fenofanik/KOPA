import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/services/Firebase_services.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  FirebaseServices firebaseServices = FirebaseServices();
  bool showLoading = false;

  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  Future googleLogIn()async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser==null)return;
    _user = googleUser;


    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((
        result) {
      String googleId = result.user.uid;
      String email = result.user.email;
      List<String> favs=[];
      firebaseServices.userRef.doc(googleId).set({
        "id": googleId,
        "favs":favs,
        "phoneNumber": email,

      });
    });
    notifyListeners();
  }

}