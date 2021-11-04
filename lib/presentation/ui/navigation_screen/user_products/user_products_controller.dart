import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';

class UserProductsController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController userTabController;


  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  List<SneakerModel> _sneakers = [];

  List<SneakerModel> get sneakers => _sneakers;

  set sneakers(List<SneakerModel> sneakers) {
    _sneakers = sneakers;
    update();
  }

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      update();
    });
  }

  Future<void> getUsersProducts() async {
    sneakers.clear();
    try{
      await SneakersService().getUserProducts().then((e) {
        if(e!=null){
          sneakers.addAll(e.toList());
          loading = false;
          update();
        }
        else{
          print(e.toList().toString());
        }
      });
    }
    catch(e){
      print(e.toString());
    }

  }

  Future <int> checkTabIndex(int i) async{
    if (i == 0) {
      print('TEST INDEX OF SHIT $i');
      await getUsersProducts();
      update();
      return i;
    }
    else{
      print('TEST INDEX OF SHIT $i');
      update();}
    return i;
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: '1'),
    Tab(text: '2'),
  ];

  @override
  Future<void> onInit() async {
      userTabController = TabController(length: myTabs.length, vsync: this);
    loading = true;
    await getCurrentUserById();
    await getUsersProducts();

    // if(userTabController.indexIsChanging){
    //   await getUserProducts();
    // }
    // else{onInit();}
    // userTabController.addListener(_handleTabSelection);
    super.onInit();
  }
}
