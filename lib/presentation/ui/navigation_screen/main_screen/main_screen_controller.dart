import 'package:get/get.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class MainScreenController extends GetxController {
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
        if (e != null) {
          sneakers.addAll(e.toList());
          loading = false;
        } else {
          sneakers.clear();
          loading = false;
        }
        update();
      });
    } catch (e) {
      errorSnack("Error get products", '$e');
    }
  }

  Future<void> getCurrentUserById() async {
    try {
      await UserService().getUserById().then((value) {
        currentUser = value;
        print("${currentUser.favorite.toList()}");
        update();
      });
    } catch (e) {
      errorSnack(AppStrings.errorGetUser, '$e');
    }
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
    } catch (e) {
      errorSnack('Error add to favorite', '$e');
    }
  }

  Future<void> deleteUserProduct(SneakerModel sneaker) async {
    loading = true;
    if (sneaker != null) {
      try {
        await SneakersService().deleteProduct(sneaker).then((value) {
          sneakers.remove(sneaker);
          messageSnack('Product', 'deleted');
          loading = false;
        });
      } catch (e) {
        print(e);
        errorSnack('Error delete product', '$e');
      }
    } else {
      print('ERROR DELETE SNEAKER' + '${sneaker.toJson()}');
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
