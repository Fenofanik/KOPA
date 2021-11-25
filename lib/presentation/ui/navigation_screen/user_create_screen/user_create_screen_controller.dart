import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/data/services/sneakers_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/user_products_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class UserCreateScreenController extends GetxController {
  UserProductsController upc = Get.find();

  final List<String> imgUrls = <String>["", "", "", "", "", "", "", ""];

  SneakerModel currentSneaker = SneakerModel();
  SneakerModel updateSneaker = SneakerModel();

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  int stamp = 0;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  String validationEmptyField(String value) {
    if (value.isEmpty) {
      return AppStrings.ErrorSnackBarText;
    }
    return null;
  }

  final TextEditingController theSize = TextEditingController();
  final TextEditingController sizeLength = TextEditingController();
  final TextEditingController sizeWidth = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController material = TextEditingController();
  final TextEditingController aboutSneaker = TextEditingController();
  final TextEditingController price = TextEditingController();

  //update
  TextEditingController theSizeUpdate;
  TextEditingController sizeLengthUpdate;
  TextEditingController sizeWidthUpdate;
  TextEditingController modelUpdate;
  TextEditingController materialUpdate;
  TextEditingController aboutSneakerUpdate;
  TextEditingController priceUpdate;

  getPhotos() {
    return imgUrls.asMap().map((key, value) {
      final isPhoto =
          (key == 0 && imgUrls[0] == "") || (key > 0 && imgUrls[key - 1] != "");
      final isImage = value != "";
      return MapEntry(
          key,
          InkWell(
            onTap: () {
              uploadImage(key);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              color: (isPhoto || isImage) ? forButtons : whiteThings,
              child: isImage
                  ? Image.network(value,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                      width: 75,
                      height: 75,
                      child: getProgress());
                },
                frameBuilder: (context, child, progress, ready) {
                  return child;
                },
              )
                  : isPhoto
                      ? const Icon(
                          Icons.panorama_rounded,
                          color: whiteThings,
                          size: 30,
                        )
                      : Container(),
            ),
          ));
    });
  }

  uploadImage(key) async {
    final _storage = FirebaseStorage.instance;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      _imageFile = await _picker.getImage(source: ImageSource.gallery);
      var file = File(_imageFile.path);

      if (_imageFile != null) {
        var snapshot = await _storage
            .ref()
            .child('UserAdd/filename-${DateTime.now().millisecondsSinceEpoch}')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        imgUrls[key] = downloadUrl;
        stamp++;
        update();
      } else {
        errorSnack('No path','received');
      }
    } else {
      print('ERROR upload image');
      errorSnack('Error','to upload image');
    }
  }

  UserModel currentUser = UserModel();

  Future<void> getCurrentUserById() async {
    await UserService().getUserById().then((value) {
      currentUser = value;
      update();
    });
  }

  Future<void> updateProduct() async {
    updateSneaker.size = theSizeUpdate.text;
    updateSneaker.length = sizeLengthUpdate.text;
    updateSneaker.width = sizeWidthUpdate.text;
    updateSneaker.brand = modelUpdate.text;
    updateSneaker.material = materialUpdate.text;
    updateSneaker.userAddAbout = aboutSneakerUpdate.text;
    updateSneaker.price = priceUpdate.text;
    updateSneaker.author = currentUser?.id;
    updateSneaker.image = imgUrls.where((x) => x != "").toList();

    if(theSizeUpdate.text.isEmpty|| sizeLengthUpdate.text.isEmpty||sizeWidthUpdate.text.isEmpty||
        modelUpdate.text.isEmpty||materialUpdate.text.isEmpty||aboutSneakerUpdate.text.isEmpty||
        priceUpdate.text.isEmpty){
      errorSnack('Error', AppStrings.ErrorSnackBarText);
    }
    else if (updateSneaker.image.isEmpty){
      errorSnack('Error', 'Add at least one image');
    }
    else{
      try {
        await SneakersService().updateProduct(updateSneaker).then((value) async {
          Get.back(result: value);
          messageSnack('Product', 'Updated');
        });
        await upc.getUsersProducts();
      } catch (e) {
        errorSnack('Error to update product', e.toString());
      }
    }

  }

  Future<void> addToCollection() async {

    SneakerModel createSneaker = SneakerModel();
    createSneaker.size = theSize.text;
    createSneaker.length = sizeLength.text;
    createSneaker.width = sizeWidth.text;
    createSneaker.brand = model.text;
    createSneaker.material = material.text;
    createSneaker.userAddAbout = aboutSneaker.text;
    createSneaker.price = price.text;
    createSneaker.author = currentUser?.id;
    createSneaker.image = imgUrls.where((x) => x != "").toList();
    currentSneaker = createSneaker;

    if(theSize.text.isEmpty|| sizeLength.text.isEmpty||sizeWidth.text.isEmpty||
        model.text.isEmpty||material.text.isEmpty||aboutSneaker.text.isEmpty||
        price.text.isEmpty){
      errorSnack('Error', AppStrings.ErrorSnackBarText);
    }
    else if (createSneaker.image.isEmpty){
      errorSnack('Error', 'Add at least one image');
    }
    else{
      try {
        loading = true;
        await SneakersService().createProduct(createSneaker).then((value) async {
          await upc.getUsersProducts();
          loading = false;
          Get.back();
          messageSnack('Product','created');
        });

      } catch (e) {
        errorSnack('Error create product', '$e');
      }
    }

  }

  void onInit() async {
    loading = false;
    await getCurrentUserById();
    final List<String> imgs = updateSneaker?.image ?? <String>[];
    for (var i = 0; i < imgs.length; i++) {
      imgUrls[i] = imgs[i];
    }

    super.onInit();
  }
}
