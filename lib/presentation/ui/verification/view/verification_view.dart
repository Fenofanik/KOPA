
import 'package:flutter/material.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/verification/data_widgets/mobile_form_widget.dart';
import 'package:kopamain/presentation/ui/verification/data_widgets/otp_form_widget.dart';
import 'package:kopamain/presentation/ui/verification/verification_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';


class  Verification1 extends BaseStatelessScreen {

  final VerificationController vc = Get.put(VerificationController());

  @override
  Widget buildBody(BuildContext context) {
    return
      GetBuilder<VerificationController>(builder: (controller){
        return  Container (
            child :
            controller.loading ?
            getProgress():
            controller.currentState?
            getMobileFormWidget(context) : getOtpFormWidget(context));
      });

  }

  @override
  Widget buildFooter(BuildContext context) {
    return null;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return null;
  }

  @override
  Widget buildFloatingButton(BuildContext context) {
    return null;
  }
}