import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}