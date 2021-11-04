
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/text_styles.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/logIn/data_widgets/logIn_shadow_image.dart';
import 'package:kopamain/presentation/ui/user_add_info/user_add_info_controller.dart';

class UserAddInfoScreen extends StatelessWidget {
  final UserAddInfoController userAddInfoController =
      Get.put(UserAddInfoController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Form(
            key: userAddInfoController.infoFormKey,
            child: Padding(
                padding:
                EdgeInsets.only(top: 40, bottom: 30, left: 45, right: 45),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child:
                        Column(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: logInShadow()),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                controller: userAddInfoController.nameController,
                                maxLength: 20,
                                validator: (String value) {
                                  return userAddInfoController.infoValid(value);
                                },
                                decoration: InputDecoration(
                                  errorBorder: otpError,
                                  focusedErrorBorder: otpFocusedError,
                                  focusedBorder: otpFocused,
                                  enabledBorder: otpEnabled,
                                  errorStyle: TextStyle(fontSize: 7),
                                  hintText: "Ім'я",
                                  hintStyle: oldStyleTextField,
                                  contentPadding: EdgeInsets.only(left: 10),
                                ),
                                style: oldStyleTextField,
                              )
                          ),
                          TextFormField(
                            controller: userAddInfoController.surNameController,
                            maxLength: 20,
                            validator: (String value) {
                              return userAddInfoController.infoValid(value);
                            },
                            decoration: InputDecoration(
                              hintText: "Прізвище",
                              errorBorder: otpError,
                              focusedErrorBorder: otpFocusedError,
                              focusedBorder: otpFocused,
                              enabledBorder: otpEnabled,
                              errorStyle: TextStyle(fontSize: 7),
                              hintStyle: oldStyleTextField,
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                            style: oldStyleTextField,
                          ),
                          TextFormField(
                            controller: userAddInfoController.cityController,
                            maxLength: 20,
                            validator: (String value) {
                              return userAddInfoController.infoValid(value);
                            },
                            decoration: InputDecoration(
                              errorBorder: otpError,
                              focusedErrorBorder: otpFocusedError,
                              focusedBorder: otpFocused,
                              enabledBorder: otpEnabled,
                              errorStyle: TextStyle(fontSize: 7),
                              // errorStyle: TextStyle(fontSize: 7),
                              hintText: "Місто",
                              hintStyle: oldStyleTextField,
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                            style: oldStyleTextField,
                          ),
                        ],),
                      ),
                      Container(
                        width: Get.width,
                        child: ElevatedButton(
                            style:
                            buttonStyle,
                            child: Text("Готово",
                                style: oldStyleTextField,
                            ),
                            onPressed: () async{
                                if (userAddInfoController.infoFormKey.currentState.validate()) {
                                  await userAddInfoController.updateUserInfo();
                                }
                            }),
                      )
                    ]))),
      ),
      backgroundColor: ThemeManager.background,
    );
  }

  // @override
  // Widget buildFloatingButton(BuildContext context) {
  //   return null;
  // }
  //
  // @override
  // Widget buildFooter(BuildContext context) {
  //   return null;
  // }
  //
  // @override
  // Widget buildHeader(BuildContext context) {
  //   return null;
  // }
}

