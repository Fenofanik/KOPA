import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import '../verification_controller.dart';
import 'package:get/get.dart';


Widget getOtpFormWidget(context,VerificationController controller){
  return Padding(
    // key: vc.formKey,
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: SingleChildScrollView(
          child: Column(
              children: [
                TextFormField(
                    controller: controller.otpController,
                    maxLength: 6,
                    obscureText: controller.secureText,
                    validator: (String value) {
                      return controller.smsCodeValid(value);
                    },
                    decoration:
                    InputDecoration(
                      errorBorder: otpError,
                      focusedErrorBorder: otpFocusedError,
                      focusedBorder: otpFocused,
                      enabledBorder: otpEnabled,
                      contentPadding: const EdgeInsets.all(10),
                      errorStyle: const TextStyle(fontSize: 7),
                      suffixIcon: IconButton(
                        icon: controller.secureText
                            ? const Icon(Icons.visibility_off,color: borderColorLog,)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          controller.secureText
                              ? controller.secureText = false
                              : controller.secureText = true;
                          controller.update();
                        },
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    style: buildThemeData().textTheme.headline4,
                ),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                      style: buttonStyle,
                      child: Text("Далі",
                          style: buildThemeData().textTheme.headline4),
                      onPressed: () async{
                        controller.validateFields();
                        // if(vc.otpController.text.isEmpty){
                        //   Get.snackbar('Incorrect', "Sms Code",colorText: redThings);
                        // }
                        // else{
                        //   vc.finalSignIn();
                        // }
                        // if (vc.formKey.currentState.validate()) {
                        //   lc.showBottomTextFields = 1;
                        //   vc.finalSignIn();
                        // }
                      }),
                )
              ])));
}