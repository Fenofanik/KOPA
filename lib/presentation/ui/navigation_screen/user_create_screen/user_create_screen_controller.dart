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
      return AppStrings.EmptyField;
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
                  ? Image.network(value, fit: BoxFit.fill)
                  : isPhoto
                      ? const Icon(
                          Icons.camera_alt_outlined,
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
        print("sd $downloadUrl");
        imgUrls[key] = downloadUrl;
        stamp++;
        update();
      } else {
        print('No path received');
      }
    } else {
      print('ERROR upload image');
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
    try {
      await SneakersService().updateProduct(updateSneaker).then((value) async {
        Get.back(result: value);
        Get.snackbar('Product', 'Updated', snackPosition: SnackPosition.TOP);
      });
      await upc.getUsersProducts();
    } catch (e) {
      Get.snackbar('Error to update product', e.toString(),
          backgroundColor: redThings, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> addToCollection() async {
    loading = true;
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

    try {
      await SneakersService().createProduct(createSneaker).then((value) async {
        loading = false;
        await upc.getUsersProducts();
        Get.back();
        Get.snackbar('Product', 'created!', snackPosition: SnackPosition.TOP);
      });
    } catch (e) {
      Get.snackbar('Error create product', '$e',
          backgroundColor: redThings, snackPosition: SnackPosition.BOTTOM);
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
