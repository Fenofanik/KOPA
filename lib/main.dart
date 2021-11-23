import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'core/constant/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      ),
      theme: buildThemeData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
