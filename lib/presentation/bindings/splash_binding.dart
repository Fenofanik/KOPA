import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/splash/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
