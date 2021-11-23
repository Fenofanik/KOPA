import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';
import 'package:kopamain/presentation/ui/verification/view/verification_view.dart';
import 'package:get/get.dart';

class SecondPart extends BaseStatelessScreen {
  final LoginController loginController = Get.find();

  @override
  Widget buildBody(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return controller.showBottomTextFields == 1
          ? Padding(
            padding: const EdgeInsets.only(top : 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: phoneButton),
                        child: IconButton(
                          iconSize: 25.0,
                          onPressed: () {
                            controller.showBottomTextFields = 2;
                            controller.update();
                          },
                          icon: const Icon(Icons.phone, color: whiteThings),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: faceBookButton),
                        child: IconButton(
                            color: whiteThings,
                            iconSize: 25.0,
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 2, left: 1),
                              child:  Center(child: const Icon(FontAwesomeIcons.facebook)),
                            ),
                            alignment: Alignment.center,
                            onPressed: () async {
                              await controller.faceSignIn();
                            })),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: googleButton),
                        child: IconButton(
                            color: whiteThings,
                            iconSize: 25.0,
                            icon: Center(child: const Icon(FontAwesomeIcons.google)),
                            alignment: Alignment.center,
                            onPressed: () async {
                              await controller.googleLogIn();
                            }))
                  ]),
          )
          : Verification1();
      // Verification();
    });
  }

  @override
  Widget buildFooter(BuildContext context) {
    return null;
  }

  @override
  Widget buildFloatingButton(BuildContext context) {
    return null;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return null;
  }
}
