import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';
import 'package:kopamain/presentation/ui/verification/view/verification_view.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/LogIn/Verification.dart';
import 'package:kopamain/widgets/LogIn/google.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class SecondPart extends BaseStatelessScreen {
  final LoginController loginController = Get.find();

  @override
  Widget buildBody(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return controller.showBottomTextFields == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeManager.phoneButton),
                      child: IconButton(
                        iconSize: 25.0,
                        onPressed: () {
                          controller.showBottomTextFields = 2;
                          controller.update();
                        },
                        icon:
                            Icon(Icons.phone, color: ThemeManager.whiteThings),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeManager.faceBookButton),
                      child: IconButton(
                          color: ThemeManager.whiteThings,
                          iconSize: 25.0,
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 2, left: 1),
                            child: new Center(
                                child: new Icon(FontAwesomeIcons.facebook)),
                          ),
                          alignment: Alignment.center,
                          onPressed: () async {
                            await controller.faceSignIn();
                          })),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeManager.googleButton),
                      child: IconButton(
                          color: ThemeManager.whiteThings,
                          iconSize: 25.0,
                          icon:
                              Center(child: new Icon(FontAwesomeIcons.google)),
                          alignment: Alignment.center,
                          onPressed: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            await provider.googleLogIn();
                            await Navigator.pushNamed(
                                context, '/Verification3');
                          }))
                ])
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
