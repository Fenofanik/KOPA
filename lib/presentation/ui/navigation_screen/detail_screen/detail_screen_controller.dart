

import 'package:get/get.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';

class DetailScreenController extends GetxController{
  MainScreenController mcs = Get.find();

  int selectedImage = 0;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  SneakerModel detailSneaker = SneakerModel();

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      update();
    });
  }

  Future <void> updateUserFavorites (SneakerModel sneaker)async{
    try {
      if(currentUser.favorite.any((element) => element == sneaker.id.trim())){
        currentUser.favorite.remove(sneaker.id.trim());
        await UserService().updateUserFavorite(currentUser).then((value) => currentUser = value);
        print("TEST USER REMOVE FAVORITE ${currentUser.favorite.toList()}");
        update();
      }
      else{
        currentUser.favorite.add(sneaker.id.trim());
        await UserService().updateUserFavorite(currentUser).then((value) => currentUser = value);
        print("TEST USER ADD FAVORITE ${currentUser.favorite.toList()}");
        update();
      }
    }
    catch(e){

    }
  }

  @override
  void onInit() async{
    loading = true;
    await getCurrentUserById();
    detailSneaker = mcs.currentSneaker;

    super.onInit();
  }


}