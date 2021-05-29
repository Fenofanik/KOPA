import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/widgets/LogIn/Initializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kopamain/widgets/LogIn/LoginPage.dart';
import 'package:kopamain/widgets/LogIn/Verification3.dart';
import 'package:kopamain/widgets/MainScreenPages/Home.dart';
import 'package:kopamain/widgets/MainScreenPages/MainScreen.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/MoreInfoScreen.dart';
import 'package:kopamain/widgets/MainScreenPages/UserCreate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeManager.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => InitializerWidget(),
        '/Verification3': (context) => Verification3(),
        '/Home': (context) => Home(),
        '/MoreInfo': (context) => MoreInfo(),
        '/MainScreen': (context) => MainScreen(isFavorite: false,isMyProduct: false,isSold: false,),
        '/UserCreate' : (context)=> UserCreate(),
        '/LoginPage': (context)=> LoginPage()
      },
    );
  }
}
