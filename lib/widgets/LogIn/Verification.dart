import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopamain/AppColors/Colors_app.dart';

enum MobileVerificationState{
  Verification,
  Verification2,
}
class Verification extends StatefulWidget {
  @override
  VerificationState createState() => VerificationState();
}

class VerificationState extends State<Verification> {
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
  bool secureText = true;
  MobileVerificationState currentState = MobileVerificationState.Verification;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential)
          .then((result){
            String _userId = result.user.uid;
            String phoneNumber = result.user.phoneNumber;
            List<String> favs=[];
            FirebaseFirestore.instance.collection('users').add({
                "id":_userId,
              "phoneNumber": phoneNumber,
              "favs":favs
            });
      });
      setState(() {
        showLoading = false;
      });
      if (authCredential?.user!=null){
        Navigator.pushNamed(context, '/Home');
      }
    }
    on FirebaseAuthException catch (e) {
      showLoading = false;
    }
  }

  getMobileFormWidget(context){
    return Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                              controller: phoneController,
                              maxLength: 13,
                              validator: (String value) {
                                if (value.isEmpty || value.length < 13) {
                                  return "Номер введено невірно";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7),
                                contentPadding: EdgeInsets.only(left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey[800]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey[800]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))),
                              ),
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                  fontSize: (14), color: Colors.white))),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: shape,
                              minimumSize: Size(290, 40),
                              padding: EdgeInsets.only(left: 35, right: 35),
                              primary: Colors.lightBlueAccent,
                            ),
                            child: Text("Верифікувати",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            onPressed: () async{
                              setState(() async{
                                if (formKey.currentState.validate()) {

                                  setState(() {
                                    showLoading = true;
                                  });
                                  await _auth.verifyPhoneNumber(
                                      phoneNumber: phoneController.text,
                                      verificationCompleted: (phoneAuthCredential) async{
                                        setState(() {
                                          showLoading=false;
                                        });
                                        //signInWithPhoneAuthCredential(phoneAuthCredential);
                                      },
                                      verificationFailed: (verificationFailed) async{
                                        setState(() {
                                          showLoading = false;
                                        });
                                      },
                                      codeSent: (verificationId,resendingToken)async{
                                        setState(() {
                                          showLoading = false;
                                          currentState = MobileVerificationState.Verification2;
                                          this.verificationId = verificationId;

                                        });

                                      },
                                      codeAutoRetrievalTimeout: (verificationId)async{

                                      });
                                }
                              });
                            }),
                      )
                    ]))));

  }
  getOtpFormWidget(context){
    return Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                              controller: otpController,
                              maxLength: 6,
                              obscureText: secureText,
                              validator: (String value) {
                                if (value.isEmpty || value.length <6) {
                                  return "Код верифікації введено невірно ";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7),
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Код верифікації номера",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey[800]),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey[800]),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(width: 2, color: Colors.red),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(width: 2, color: Colors.red),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                              ),
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                  fontSize: (14), color: Colors.white))),
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: shape,
                                minimumSize: Size(290, 40),
                                padding: EdgeInsets.only(left: 35, right: 35),
                                primary: Colors.lightBlueAccent,
                              ),
                              child: Text("Далі",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              onPressed: () async{

                                setState(() async{
                                  if (formKey.currentState.validate()) {
                                    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);

                                    signInWithPhoneAuthCredential(phoneAuthCredential);
                                    Navigator.pushNamed(context, '/Verification3');
                                  }
                                });
                              }))
                    ]))));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeManager.background,
        body: Container (
            child :showLoading?Center(child: CircularProgressIndicator(),): currentState == MobileVerificationState.Verification ?
            getMobileFormWidget(context) : getOtpFormWidget(context))
    );
  }
}
