import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class UserFavoriteController extends GetxController {
  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  final favorite = GlobalKey<RefreshIndicatorState>();

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    try {
      await UserService().getUserById().then((value) {
        loading = false;
        currentUser = value;
        print("${currentUser.toString()}");
        update();
      });
    } catch (e) {
      errorSnack(AppStrings.errorGetUser, '$e');
    }
  }

  SneakerModel currentSneaker = SneakerModel();

  List<SneakerModel> _sneakers = [];

  List<SneakerModel> get sneakers => _sneakers;

  set sneakers(List<SneakerModel> sneakers) {
    _sneakers = sneakers;
    update();
  }

  Future<void> getFavoriteSneakers() async {
    sneakers.clear();
    try {
      loading = true;
      await SneakersService().getFavorites().then((e) {
        if (e == null) {
          sneakers.clear();
        } else {
          sneakers.addAll(e.toList());
        }
      });
    } catch (e) {
      // errorSnack('Test','$e');
      print(e.toString());
    }
    loading = false;
    update();
  }

  Future<void> updateUserFavorites(SneakerModel sneaker) async {
    try {
      if (currentUser.favorite.any((element) => element == sneaker.id.trim())) {
        currentUser.favorite.remove(sneaker.id.trim());
        await UserService()
            .updateUserFavorite(currentUser)
            .then((value) => currentUser = value);
        sneakers.remove(sneaker);
        print("TEST USER REMOVE FAVORITE ${currentUser.favorite.toList()}");
        update();
      } else {
        currentUser.favorite.add(sneaker.id.trim());
        await UserService()
            .updateUserFavorite(currentUser)
            .then((value) => currentUser = value);
        sneakers.add(sneaker);
        print("TEST USER ADD FAVORITE ${currentUser.favorite.toList()}");
        update();
      }
    } catch (e) {
      errorSnack('Error to update favorites', '$e');
    }
  }

  @override
  void onInit() async {
    loading = true;
    await getCurrentUserById();
    await getFavoriteSneakers();
    super.onInit();
  }
}
