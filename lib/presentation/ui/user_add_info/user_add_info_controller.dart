import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class UserAddInfoController extends GetxController {

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
        loading = false;
      });
      update();
    } catch (e) {
      errorSnack(AppStrings.errorGetUser, '$e');
    }
  }

  String infoValid(String value) {
    if (value.isEmpty || RegExp('[0-9]').hasMatch(value)) {
      return "Поле не повинне бути порожнім або містити цифри";
    }
    return null;
  }

  Future<void> updateUserInfo() async {
    currentUser.firstName = nameController.text;
    currentUser.secondName = surNameController.text;
    currentUser.city = cityController.text;
    if(nameController.text.isEmpty ||surNameController.text.isEmpty||
        cityController.text.isEmpty){
      errorSnack('Field', 'can not be empty');
    }
    else{
      try {
        loading = true;
        await UserService().updateUserInfo(currentUser).then((value) {
          if (value != null) {
            currentUser = value;
            update();
            Get.offAndToNamed(Routes.NavigationScreen)
                .then((value) => loading = false);
          }
        });
      } catch (e) {
        errorSnack('Error to update user', e.toString());
        print(e.toString());
      }
    }
  }

  @override
  void onInit() async {
    loading = true;
    await getCurrentUserById();
    super.onInit();
  }
}
