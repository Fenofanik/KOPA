import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';

class NavigationController extends GetxController {

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
    update();
  }

  SneakerModel currentSneaker = SneakerModel();

  List<SneakerModel> _sneakers = [];

  List<SneakerModel> get sneakers => _sneakers;

  set sneakers(List<SneakerModel> sneakers) {
    _sneakers = sneakers;
    update();
  }

  void clearAllControllers(){
    filterBrand.clear();
    filterMaterial.clear();
    filterSize.clear();
    filterPrice.clear();
  }

  @override
  Future <void> onInit() async{
    loading = true;
    super.onInit();
  }
}
