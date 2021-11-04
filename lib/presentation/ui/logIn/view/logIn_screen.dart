import 'package:flutter/material.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:kopamain/presentation/ui/logIn/data_widgets/login_screen_first_part.dart';
import 'package:kopamain/presentation/ui/logIn/data_widgets/login_screen_second_part.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class LogInScreen extends BaseStatelessScreen {
  final LoginController loginController = Get.find();

  @override
  Widget buildBody(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return controller.loading
          ? getProgress()
          : Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Expanded(flex: 3, child: FirstPart()),
              Expanded(
                  child: controller.showBottomTextFields == 2
                      ? SecondPart()
                      : Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: SecondPart(),
                        ))
              // Expanded(child: MainPart(), flex: 6),
              // Expanded(child: ButtonLogIn(), flex: 2)
            ]);
    });
  }


  @override
  Widget buildFloatingButton(BuildContext context) {
    return null;
  }

  @override
  Widget buildFooter(BuildContext context) {
    return null;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return null;
  }
}
