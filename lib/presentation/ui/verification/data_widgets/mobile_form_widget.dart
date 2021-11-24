import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import '../verification_controller.dart';

Widget getMobileFormWidget(context,VerificationController controller){
  return Padding(
    //key: vc.phoneFormKey,
      padding:  const EdgeInsets.only(left: 35, right: 35),
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
                controller: controller.phoneController,
                maxLength: 13,
                validator: (String value) {
                  return controller.phoneValid(value);
                },
                decoration: oldStyle,
                keyboardType: TextInputType.phone,
                style: buildThemeData().textTheme.headline4
            ),
            Container(
              width: Get.width,
              child: ElevatedButton(
                  style:
                  buttonStyle,
                  child: Text("Верифікувати",
                      style: buildThemeData().textTheme.headline4),
                  onPressed: () async{
                    if(controller.phoneController.text.isEmpty ||
                        controller.phoneController.text.length <13){
                      errorSnack('Incorrect', "Number");
                    }
                    else{
                      await controller.signInWithPhone();
                    }
                  }),
            )
          ]));

}