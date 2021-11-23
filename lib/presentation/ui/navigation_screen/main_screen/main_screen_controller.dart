import 'package:get/get.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/domain/models/user_model.dart';

class MainScreenController extends GetxController {
  // bool isMainScreen = true;
  // bool isFavoriteScreen = false;
  // bool isUserProductScreen = false;
  // bool isProfileScreen = false;

  String searchQuery = '';

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  final TextEditingController searchController = TextEditingController();

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  TextEditingController brand = TextEditingController();
  TextEditingController material = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController price = TextEditingController();

  UserModel currentUser = UserModel();

  SneakerModel currentSneaker = SneakerModel();

  List<SneakerModel> _sneakers = [];

  List<SneakerModel> get sneakers => _sneakers;

  set sneakers(List<SneakerModel> sneakers) {
    _sneakers = sneakers;
    update();
  }

  Future<void> getAllSneakers() async {
    sneakers.clear();
    loading = true;
    try {
      await SneakersService().getSneakerList().then((e) {
        sneakers.addAll(e.toList());
        loading = false;
        update();
      });
    } catch (e) {
      loading = true;
      Get.snackbar("Error", '$e');
    }
  }

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      print("${currentUser.favorite.toList()}");
      update();
    });
  }

  Future<void> updateUserFavorites(SneakerModel sneaker) async {
    try {
      if (currentUser.favorite.any((element) => element == sneaker.id.trim())) {
        currentUser.favorite.remove(sneaker.id.trim());
        await UserService()
            .updateUserFavorite(currentUser)
            .then((value) => currentUser = value);
        print("TEST USER REMOVE FAVORITE ${currentUser.favorite.toList()}");
        update();
      } else {
        currentUser.favorite.add(sneaker.id.trim());
        await UserService()
            .updateUserFavorite(currentUser)
            .then((value) => currentUser = value);
        print("TEST USER ADD FAVORITE ${currentUser.favorite.toList()}");
        update();
      }
    } catch (e) {}
  }

  Future<void> deleteUserProduct(SneakerModel sneaker) async {
    loading = true;
    if (sneaker != null) {
      try {
        await SneakersService().deleteProduct(sneaker).then((value) {
          sneakers.remove(sneaker);
          Get.snackbar('Product', 'Deleted');
          loading = false;
        });
      } catch (e) {
        print(e);
      }
    } else {
      print('ERROR DELETE SNEAKER');
    }
  }

  void clearControllers() {
    brand.clear();
    material.clear();
    size.clear();
    price.clear();
  }

  void listenToControllers() {
    brand.addListener(() {
      if (brand.text.trim().isNotEmpty) {
        searchQuery = brand.text.trim();
        update();
      } else {
        searchQuery = '';
        update();
      }
    });
    material.addListener(() {
      if (material.text.trim().isNotEmpty) {
        searchQuery = material.text.trim();
        update();
      } else {
        searchQuery = '';
        update();
      }
    });
    size.addListener(() {
      if (size.text.trim().isNotEmpty) {
        searchQuery = size.text.trim();
        update();
      } else {
        searchQuery = '';
        update();
      }
    });
    price.addListener(() {
      if (price.text.trim().isNotEmpty) {
        searchQuery = price.text.trim();
        update();
      } else {
        searchQuery = '';
        update();
      }
    });
  }

  @override
  Future<void> onInit() async {
    loading = true;
    await getCurrentUserById();
    await getAllSneakers();
    listenToControllers();

    super.onInit();
  }
}
