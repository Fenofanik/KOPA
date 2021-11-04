import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/elevated_buttons_style.dart';
import 'package:kopamain/core/constant/textField_borders.dart';
import 'package:kopamain/core/constant/text_styles.dart';
import '../verification_controller.dart';

final VerificationController vc = Get.find();

Widget getMobileFormWidget(context){
  return Form(
      key: vc.formKey,
      child: Padding(
          padding:  const EdgeInsets.only(left: 35, right: 35),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                    controller: vc.phoneController,
                    maxLength: 13,
                    validator: (String value) {
                      return vc.phoneValid(value);
                      // if (value.isEmpty || value.length < 13) {
                      //   return "Номер введено невірно";
                      // }
                      // return null;
                    },
                    decoration: oldStyle,
                    keyboardType: TextInputType.phone,
                    style: oldStyleTextField
                ),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                      style:
                      buttonStyle,
                      child: Text("Верифікувати",
                          style: oldStyleTextField),
                      onPressed: () async{
                        if(vc.formKey.currentState.validate()){
                         await vc.signInWithPhone();
                         vc.loading = true;
                         vc.update();
                      }
                      }),
                )
              ])));

}