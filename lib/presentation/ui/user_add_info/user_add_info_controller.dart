import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';

class UserAddInfoController extends GetxController {

  final infoFormKey = GlobalKey<FormState>();

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void clearControllers() {
    nameController.clear();
    surNameController.clear();
    cityController.clear();
  }

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    loading = false;
    try {
      await UserService().getUserById().then((value) {
        currentUser = value;
        print("CURRENT USER  ID ${value.id}");
        loading = false;
      });
      update();
    } catch (e) {
      Get.snackbar('Error get user', '$e',backgroundColor: redThings);
    }
  }

  String infoValid(String value) {
    if (value.isEmpty || RegExp('[0-9]').hasMatch(value)) {
      return "Поле не повинне бути порожнім або містити цифри";
    }
    return null;
  }

  Future<void> updateUserInfo() async {
    loading = true;
    currentUser.firstName = nameController.text;
    currentUser.secondName = surNameController.text;
    currentUser.city = cityController.text;
    try {
      await UserService().updateUserInfo(currentUser).then((value) {
        if(value!=null){
          currentUser = value;
          update();
          Get.offAndToNamed(Routes.NavigationScreen);
          loading = false;
        }
      });

    } catch (e) {
      Get.snackbar('Error to update user: ', e.toString(),backgroundColor: redThings);
      print(e.toString());
    }
  }


  @override
  void onInit() async {
    loading = true;
    await getCurrentUserById();
    super.onInit();
  }
}
