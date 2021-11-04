
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
