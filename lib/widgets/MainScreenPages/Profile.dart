import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/widgets/LogIn/LoginPage.dart';
import 'package:get/get.dart';

class ProfileScreenMain extends StatefulWidget {
  @override
  ProfileScreenMainState createState() => ProfileScreenMainState();
}

class ProfileScreenMainState extends State<ProfileScreenMain> {
  final _auth = FirebaseAuth.instance;
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: shape,
              minimumSize: Size(290, 40),
              padding: EdgeInsets.only(left: 35, right: 35),
              primary: Colors.lightBlueAccent,
            ),
            child: Text("Вийти",
                style: TextStyle(
                    fontSize: 14, color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
             Get.to(LoginPage());
            }
                      ))));
  }
}