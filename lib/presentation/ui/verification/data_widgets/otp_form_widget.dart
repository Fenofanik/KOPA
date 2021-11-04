import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/text_styles.dart';
import '../verification_controller.dart';
import 'package:get/get.dart';

final VerificationController vc = Get.find();


Widget getOtpFormWidget(context){
  return Form(
      key: vc.formKey,
      child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: SingleChildScrollView(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                        controller: vc.otpController,
                        maxLength: 6,
                        obscureText: vc.secureText,
                        validator: (String value) {
                          return vc.smsCodeValid(value);
                          // if (value.isEmpty || value.length <6) {
                          //   return "Код верифікації введено невірно ";
                          // }
                          // return null;
                        },
                        decoration:
                        InputDecoration(
                          errorBorder: otpError,
                          focusedErrorBorder: otpFocusedError,
                          focusedBorder: otpFocused,
                          enabledBorder: otpEnabled,
                          contentPadding: const EdgeInsets.all(10),
                          errorStyle: TextStyle(fontSize: 7),
                          suffixIcon: IconButton(
                            icon: vc.secureText
                                ? Icon(Icons.visibility_off,color: redThings,)
                                : Icon(Icons.visibility,color: whiteThings,),
                            onPressed: () {
                              vc.secureText
                                  ? vc.secureText = false
                                  : vc.secureText = true;
                              vc.update();
                            },
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        style: oldStyleTextField,
                    ),
                    Container(
                      width: Get.width,
                      child: ElevatedButton(
                          style: buttonStyle,
                          child: Text("Далі",
                              style: oldStyleTextField),
                          onPressed: () async{
                            if (vc.formKey.currentState.validate()) {
                              vc.finalSignIn();
                            }
                          }),
                    )
                  ]))));
}