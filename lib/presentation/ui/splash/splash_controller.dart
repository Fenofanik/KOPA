
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/firebase.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';


class SplashController extends GetxController{
  // final LoginController loginController = Get.put(LoginController());
  User user = auth.currentUser;
  final int splashDelay = 3;

  @override
  void onInit() async{

    await Future.delayed(Duration(seconds: splashDelay),(){
      Get.offAndToNamed(Routes.LogIn);
      //toNamed(Routes.LogIn)
      // loginController.setInitialScreen(user);
    });
    super.onInit();
  }
}