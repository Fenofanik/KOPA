import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/routes/app_pages.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ProfileController extends GetxController {
  bool _loading = true;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    update();
  }

  FirebaseAuth _auth;

  PickedFile _imageFile;
  String imageUrl;
  final ImagePicker _picker = ImagePicker();

  UserModel currentUser = UserModel();

  Future<void> getCurrentUser() async {
    try {
      await UserService().getUserById().then((value) {
        if (value != null) {
          print(value.toString());
          currentUser = value;
          loading = false;
        } else {
          print(value.toString());
          errorSnack(AppStrings.errorGetUser, '${value.toString()}');
        }
      });
      update();
    } catch (e) {
      print("ERROR GET USER: ${e.toString()}");
      errorSnack("ERROR GET USER", " ${e.toString()}");
    }
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      _imageFile = await _picker.getImage(source: ImageSource.gallery);
      var file = File(_imageFile.path);

      if (_imageFile != null) {
        var snapshot = await _storage.ref()
            .child('folderName/usersImage${DateTime.now().millisecondsSinceEpoch}')
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        imageUrl = downloadUrl;
        currentUser.image = downloadUrl;
        try {
          await UserService().updateUserImage(currentUser).then((value) {
            if (value != null) {
              currentUser = value;
            }
          });
          update();
        } catch (e) {
          print(e.toString());
        }
        update();
      } else {
        errorSnack('Error to upload file', 'No path received');
      }
    } else {
      print('${permissionStatus.toString()}');
    }
  }

  signOut() async {
    Get.offAllNamed(Routes.LogIn);
    _auth.signOut();
  }

  @override
  void onInit() async {
    _auth = FirebaseAuth.instance;
    loading = true;
    await getCurrentUser();
    super.onInit();
  }
}
