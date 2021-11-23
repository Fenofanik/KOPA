import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/profile_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}