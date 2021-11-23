
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/verification/data_widgets/mobile_form_widget.dart';
import 'package:kopamain/presentation/ui/verification/data_widgets/otp_form_widget.dart';
import 'package:kopamain/presentation/ui/verification/verification_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';


class  Verification1 extends StatelessWidget {
  final VerificationController vc = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child: GetBuilder<VerificationController>(builder: (controller){
            return  Container (
                child :
                controller.loading ?
                getLinearProgress():
                controller.currentState?
                getMobileFormWidget(context,controller) : getOtpFormWidget(context,controller));
          }),
        ),
      );

  }
}