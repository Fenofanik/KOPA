import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/logIn/data_widgets/logIn_shadow_image.dart';
import 'package:kopamain/presentation/ui/user_add_info/user_add_info_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class UserAddInfoScreen extends StatelessWidget {
  final UserAddInfoController userAddInfoController =
      Get.put(UserAddInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<UserAddInfoController>(builder: (controller) {
        return controller.loading
            ? getProgress()
            : SingleChildScrollView(
              child: Padding(
                //key: controller.infoFormKey,
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 30,left: 45, right: 45),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: logInShadow()),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: controller.nameController,
                                  maxLength: 20,
                                  validator: (String value) {
                                    return controller.infoValid(value);
                                  },
                                  decoration: InputDecoration(
                                    errorBorder: otpError,
                                    focusedErrorBorder: otpFocusedError,
                                    focusedBorder: otpFocused,
                                    enabledBorder: otpEnabled,
                                    errorStyle: const TextStyle(fontSize: 7),
                                    hintText: "Ім'я",
                                    hintStyle: buildThemeData().textTheme.headline4,
                                    contentPadding:
                                    const EdgeInsets.only(left: 10),
                                  ),
                                  style: buildThemeData().textTheme.headline4,
                                )),
                            TextFormField(
                              controller: controller.surNameController,
                              maxLength: 20,
                              validator: (String value) {
                                return controller.infoValid(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Прізвище",
                                errorBorder: otpError,
                                focusedErrorBorder: otpFocusedError,
                                focusedBorder: otpFocused,
                                enabledBorder: otpEnabled,
                                errorStyle: const TextStyle(fontSize: 7),
                                hintStyle: buildThemeData().textTheme.headline4,
                                contentPadding: const EdgeInsets.only(left: 10),
                              ),
                              style: buildThemeData().textTheme.headline4,
                            ),
                            TextFormField(
                              controller: controller.cityController,
                              maxLength: 20,
                              validator: (String value) {
                                return controller.infoValid(value);
                              },
                              decoration: InputDecoration(
                                errorBorder: otpError,
                                focusedErrorBorder: otpFocusedError,
                                focusedBorder: otpFocused,
                                enabledBorder: otpEnabled,
                                errorStyle: const TextStyle(fontSize: 7),
                                hintText: "Місто",
                                hintStyle: buildThemeData().textTheme.headline4,
                                contentPadding: const EdgeInsets.only(left: 10),
                              ),
                              style: buildThemeData().textTheme.headline4,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: Get.width,
                          child: ElevatedButton(
                              style: buttonStyle,
                              child: Text(
                                "Готово",
                                style: buildThemeData().textTheme.headline4,
                              ),
                              onPressed: () async {

                                await controller.updateUserInfo();
                                controller.loading = true;
                                // if (controller.infoFormKey.currentState
                                //     .validate()) {
                                //   controller.loading = true;
                                //   await controller.updateUserInfo();
                                // }
                              }),
                        )
                      ])),
            );
      })),
      backgroundColor: background,
    );
  }
}
