import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/widgets/LogIn/Initializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: InitializerWidget(),
    );
  }
}

