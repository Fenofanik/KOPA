import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/user_products_controller.dart';

class DetailScreenController extends GetxController{
  MainScreenController mcs = Get.find();
  UserProductsController upc = Get.find();

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

  Future <void> addProductToArchive(SneakerModel sneaker)async{
    sneaker.sold = true;
    try{
      loading = true;
      await SneakersService().moveProductToArchive(sneaker).then((value) async{
        detailSneaker = value;
        await upc.getUsersArchive();
        await upc.getUsersProducts();
        await mcs.getAllSneakers();
      });
      Get.snackbar('Product', 'moved to archive',snackPosition: SnackPosition.BOTTOM);
    }catch(e){
      Get.snackbar('Error move product to archive ', '$e',backgroundColor: redThings);
    }
  }

  Future<void> deleteUserProduct(SneakerModel sneaker) async {
    loading = true;
    if (sneaker != null) {
      try {
        await SneakersService().deleteProduct(sneaker).then((value) async{
          mcs.sneakers.remove(sneaker);
          await mcs.getAllSneakers();
          await upc.getUsersProducts();
          await upc.getUsersArchive();
          loading = false;
          Get.back();
          Get.snackbar('Product', 'Deleted',snackPosition: SnackPosition.BOTTOM);
        });
      } catch (e) {
        print(e);
      }
    } else {
      print('ERROR DELETE SNEAKER');
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