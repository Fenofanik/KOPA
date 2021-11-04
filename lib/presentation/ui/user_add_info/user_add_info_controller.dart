

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';

class UserAddInfoController extends GetxController{

  final infoFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();


  void clearControllers(){
    nameController.clear();
    surNameController.clear();
    cityController.clear();
  }

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      update();
    });
  }

  String infoValid(String value){
    if (value.isEmpty ||
        RegExp('[0-9]').hasMatch(value)) {
      return "Поле не повинне бути порожнім або містити цифри";
    }
    return null;
  }

  Future <void> updateUserInfo()async{
    currentUser.firstName = nameController.text;
    currentUser.secondName = surNameController.text;
    currentUser.city = cityController.text;
    try{
      await FirebaseServices().userRef.doc(currentUser.id).update({
        "name": currentUser.firstName,
        "secondName": currentUser.secondName,
        "city": currentUser.city
      });
    }catch(e){
      print(e.toString());
    }
    // FirebaseServices firebaseServices =
    // FirebaseServices();
    // String _userId =
    // firebaseServices.getUserId();
    // String name = nameController.text;
    // String secondName =
    //     surNameController.text;
    // String city = cityController.text;
   // await  FirebaseFirestore.instance
   //      .collection('users')
   //      .doc(_userId)
   //      .update({
   //    "name": name,
   //    "secondName": secondName,
   //    "city": city
   //  });
    Get.toNamed(Routes.NavigationScreen);
  }
  @override
  void onInit() async{
   await getCurrentUserById();
    super.onInit();
  }

}