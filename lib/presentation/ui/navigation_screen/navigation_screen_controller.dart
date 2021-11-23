import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationController extends GetxController {
  bool isMainScreen = true;
  bool isFavoriteScreen = false;
  bool isUserProductScreen = false;
  bool isProfileScreen = false;
  bool isDetail = false;

  TextEditingController filterBrand = TextEditingController();
  TextEditingController filterMaterial = TextEditingController();
  TextEditingController filterSize = TextEditingController();
  TextEditingController filterPrice = TextEditingController();


  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  int selectedIndex = 0;

  onTapHandler(int index) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      isMainScreen = true;
      isUserProductScreen = false;
      isFavoriteScreen = false;
      isProfileScreen = false;
      update();
    } else if (selectedIndex == 1) {
      isMainScreen = false;
      isFavoriteScreen = false;
      isProfileScreen = false;
      isUserProductScreen = true;
      update();
    } else if (selectedIndex == 2) {
      isMainScreen = false;
      isUserProductScreen = false;
      isProfileScreen = false;
      isFavoriteScreen = true;
      update();
    }else  if(selectedIndex == 3) {
      isMainScreen = false;
      isUserProductScreen = false;
      isFavoriteScreen = false;
      isProfileScreen = true;
      update();
    }
    update();
  }

  void clearAllControllers() {
    filterBrand.clear();
    filterMaterial.clear();
    filterSize.clear();
    filterPrice.clear();
  }

  @override
  void onInit() async {
    isMainScreen = true;
    isFavoriteScreen = false;
    isUserProductScreen = false;
    isProfileScreen = false;
    isDetail = false;
    loading = true;
    super.onInit();
  }
}
