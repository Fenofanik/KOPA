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

  bool _loadingArchive = true;

  bool get loadingArchive => _loadingArchive;

  set loadingArchive(bool loadingArchive) {
    _loadingArchive = loadingArchive;
    update();
  }

  List<SneakerModel> _sneakers = [];

  List<SneakerModel> get sneakers => _sneakers;

  set sneakers(List<SneakerModel> sneakers) {
    _sneakers = sneakers;
    update();
  }

  List<SneakerModel> _sneakersArchive = [];

  List<SneakerModel> get sneakersArchive => _sneakersArchive;

  set sneakersArchive(List<SneakerModel> sneakersArchive) {
    _sneakersArchive = sneakersArchive;
    update();
  }

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      update();
    });
  }

  final userProducts = GlobalKey<RefreshIndicatorState>();
  final userArchive = GlobalKey<RefreshIndicatorState>();

  Future<void> getUsersProducts() async {
    loading = true;
    sneakers.clear();
    try {
      await SneakersService().getUserProducts().then((e) {
        if (e != null) {
          sneakers.addAll(e.toList());
          loading = false;
          update();
        } else {
          print(e.toList().toString());
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getUsersArchive() async {
    loadingArchive = true;
    sneakersArchive.clear();
    try {
      await SneakersService().getUserArchive().then((e) {
        if (e != null) {
          sneakersArchive.addAll(e.toList());
          loadingArchive = false;
          update();
        } else {
          print(e.toList().toString());
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> checkTabIndex(int i) async {
    if (i == 0) {
      await getUsersProducts();
      return i;
    } else {
      await getUsersArchive();
    }
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
    loadingArchive = true;
    await getCurrentUserById();
    await getUsersProducts();
    await getUsersArchive();
    super.onInit();
  }
}
