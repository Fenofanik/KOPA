import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_create_screen/data_widgets/user_create_product_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_create_screen/user_create_screen_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class UserCreateScreen extends StatelessWidget {
  final SneakerModel sneaker;

  UserCreateScreen({this.sneaker});

  final UserCreateScreenController createController =
      Get.put(UserCreateScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCreateScreenController>(
      builder: (controller) {
        controller.updateSneaker = sneaker;
        controller.theSizeUpdate =
            TextEditingController(text: controller.updateSneaker?.size);
        controller.sizeLengthUpdate =
            TextEditingController(text: controller.updateSneaker?.length);
        controller.sizeWidthUpdate =
            TextEditingController(text: controller.updateSneaker?.width);
        controller.modelUpdate =
            TextEditingController(text: controller.updateSneaker?.brand);
        controller.materialUpdate =
            TextEditingController(text: controller.updateSneaker?.material);
        controller.aboutSneakerUpdate =
            TextEditingController(text: controller.updateSneaker?.userAddAbout);
        controller.priceUpdate =
            TextEditingController(text: controller.updateSneaker?.price);
        return Scaffold(
          backgroundColor: background,
          body: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: controller.loading
                  ? getProgress()
                  : userCreateProductView(context, controller),
            ),
          ),
          appBar: AppBar(
            backgroundColor: bottomBarBack,
            leading: IconButton(
              icon: buildBackIosButton(),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              controller.updateSneaker != null
                  ? TextButton(
                      onPressed: () async {
                        updateProductDialog(controller);
                      },
                      child: Text(
                        AppStrings.Update,
                        style: buildThemeData().textTheme.headline2,
                      ))
                  : TextButton(
                      onPressed: () async {
                        await controller.addToCollection();
                      },
                      child: Text(AppStrings.Save))
            ],
            title: sneaker != null
                ? Text(AppStrings.UpdateProduct)
                : Text(AppStrings.CreateProduct),
          ),
        );
      },
    );
  }
}
