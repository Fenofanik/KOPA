
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';

class VerificationController extends GetxController{

  bool currentState = true;

  final formKey = GlobalKey<FormState>();
  bool secureText = true;
  String verificationCodeId;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  String phoneValid(String value){
      if (value.isEmpty || value.length < 13) {
        Get.snackbar('Incorrect', "Number",colorText: redThings);
        return "Номер введено невірно";
      }
      // update();
      return null;
  }

  String smsCodeValid(String value){
    if (value.isEmpty || value.length <6) {
      Get.snackbar('Incorrect', "Sms Code",colorText: redThings);
      return "Код верифікації введено невірно ";
    }
    return null;
  }

  Future <void> signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    FirebaseServices firebaseServices = FirebaseServices();
    loading = true;
    try {
      await firebaseServices.firebaseAuth.signInWithCredential(phoneAuthCredential)
          .then((result){
        String _userId = result.user.uid;
        String phoneNumber = result.user.phoneNumber;
        List<String> favs=[];
        String photo = result.user.photoURL;

        firebaseServices.userRef.doc(_userId).set({
          "id":_userId,
          "phoneNumber": phoneNumber,
          "favs":favs,
          'imageUrl' : photo

        });
        if (result.user!=null){
          print(result.user.toString());
          Get.toNamed(Routes.UserAddInfo);
        }
        else{
          Get.snackbar("Failed", "SignIn");
          Get.toNamed(Routes.LogIn);
        }
      });
      loading = true;
      update();

    }
    on FirebaseAuthException catch (e) {
      loading = false;
      update();
      print(e);
    }
  }

  Future <void> signInWithPhone()async{
    await
    FirebaseServices().firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (phoneAuthCredential) async{
          loading = false;
          update();
          //signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async{
          Get.snackbar('Verification', 'Failed',colorText: whiteThings);
          loading = false;
          update();
        },
        codeSent: (verificationId,resendingToken)async{
          loading = false;
          currentState =  false;
              // MobileVerificationState.Verification2;
          verificationCodeId = verificationId;
          print("====================== VerificationID==================: "+ verificationCodeId);
          update();
        },
        codeAutoRetrievalTimeout: (verificationId)async{
        });
  }

  Future<void> finalSignIn ()async{
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: verificationCodeId, smsCode: otpController.text);
    await signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    loading = false;
    super.onInit();
  }

}