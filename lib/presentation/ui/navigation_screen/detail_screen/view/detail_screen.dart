import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/app_boarders.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/data_widgets/detail_image_swipe_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_create_screen/view/user_create_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';
import 'package:kopamain/presentation/utils/app_bar.dart';
import '../detail_screen_controller.dart';

class DetailScreen extends StatelessWidget {
  final SneakerModel sneakerModel;

  DetailScreen({this.sneakerModel});

  final DetailScreenController dsc = Get.put(DetailScreenController());
  final MainScreenController mcs = Get.find();
  final UserFavoriteController ufc = Get.find();
  final NavigationController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<DetailScreenController>(builder: (controller) {
        controller.detailSneaker = sneakerModel;
        return SingleChildScrollView(
            child: Container(
                color: background,
                height: Get.height,
                width: Get.width,
                child: Card(
                  shape: detailBorder,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    color: containerColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            flex: 6,
                            child: controller.detailSneaker.image == null ||
                                    controller.detailSneaker.image.isEmpty
                                ? const Icon(
                                    Icons.camera_enhance_outlined,
                                    color: whiteThings,
                                  )
                                : detailImageSwipeView(
                                    controller.detailSneaker.image,
                                    controller)),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    decoration: priceContainer,
                                    height: Get.height / 20,
                                    width: Get.width / 4.5,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Text(sneakerModel.price,
                                            textAlign: TextAlign.center,
                                            style: buildThemeData()
                                                .textTheme
                                                .subtitle2)
                                        .paddingOnly(top: 7),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: controller.detailSneaker.author ==
                                            controller.currentUser.id
                                        ? Row(
                                            children: [
                                              IconButton(
                                                  icon: const Icon(
                                                      Icons.create_outlined,
                                                      // size: 42,
                                                      color: whiteThings),
                                                  onPressed: () async {
                                                    var res = await Get.to(() =>
                                                        UserCreateScreen(
                                                          sneaker: sneakerModel,
                                                        ));
                                                    controller.detailSneaker =
                                                        res;
                                                    controller.update();
                                                  }),
                                              IconButton(
                                                  icon: const Icon(
                                                      Icons.delete_outline,
                                                      color: whiteThings),
                                                  onPressed: () async {
                                                    await controller
                                                        .deleteUserProduct(
                                                            controller
                                                                .detailSneaker);
                                                  }),
                                            ],
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.favorite,
                                                size: 42,
                                                color: controller.currentUser
                                                            .favorite !=
                                                        null
                                                    ? controller.currentUser
                                                            .favorite
                                                            .any((element) =>
                                                                element ==
                                                                controller
                                                                    .detailSneaker
                                                                    .id
                                                                    .trim())
                                                        ? redThings
                                                        : whiteThings
                                                    : whiteThings),
                                            onPressed: () async {
                                              controller.updateUserFavorites(
                                                  controller.detailSneaker);
                                              mcs.onInit();
                                              ufc.onInit();
                                            }),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                        controller.detailSneaker.brand ==
                                                    null ||
                                                controller
                                                        .detailSneaker.brand ==
                                                    AppStrings.NullString ||
                                                controller
                                                        .detailSneaker.brand ==
                                                    AppStrings.EmptyString
                                            ? AppStrings.NoInfo
                                            : controller.detailSneaker.brand,
                                        style: buildThemeData()
                                            .textTheme
                                            .bodyText2),
                                    Text(AppStrings.TheSizeOfTheFoot,
                                        style: buildThemeData()
                                            .textTheme
                                            .headline2),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  controller.detailSneaker
                                                                  .size ==
                                                              null ||
                                                          controller
                                                                  .detailSneaker
                                                                  .size ==
                                                              AppStrings
                                                                  .NullString ||
                                                          controller
                                                                  .detailSneaker
                                                                  .size ==
                                                              AppStrings
                                                                  .EmptyString
                                                      ? AppStrings.NoInfo
                                                      : controller
                                                          .detailSneaker.size,
                                                  style: buildThemeData()
                                                      .textTheme
                                                      .headline6),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Text(
                                                  AppStrings.EU,
                                                  style: buildThemeData()
                                                      .textTheme
                                                      .headline2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller.detailSneaker
                                                                  .length ==
                                                              null ||
                                                          controller
                                                                  .detailSneaker
                                                                  .length ==
                                                              AppStrings
                                                                  .NullString ||
                                                          controller
                                                                  .detailSneaker
                                                                  .length ==
                                                              AppStrings
                                                                  .EmptyString
                                                      ? AppStrings.NoInfo
                                                      : controller
                                                          .detailSneaker.length,
                                                  style: buildThemeData()
                                                      .textTheme
                                                      .headline6,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    AppStrings.LengthOf,
                                                    style: buildThemeData()
                                                        .textTheme
                                                        .headline2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller.detailSneaker
                                                                  .width ==
                                                              null ||
                                                          controller
                                                                  .detailSneaker
                                                                  .width ==
                                                              AppStrings
                                                                  .NullString ||
                                                          controller
                                                                  .detailSneaker
                                                                  .width ==
                                                              AppStrings
                                                                  .EmptyString
                                                      ? AppStrings.NoInfo
                                                      : controller
                                                          .detailSneaker.width,
                                                  style: buildThemeData()
                                                      .textTheme
                                                      .headline6,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    AppStrings.WidthOf,
                                                    style: buildThemeData()
                                                        .textTheme
                                                        .headline2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 5),
                                      child: Row(
                                        children: [
                                          Text(AppStrings.Material + ': ',
                                              style: buildThemeData()
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            controller.detailSneaker.material ==
                                                        null ||
                                                    controller.detailSneaker
                                                            .material ==
                                                        AppStrings.NullString ||
                                                    controller.detailSneaker
                                                            .material ==
                                                        AppStrings.EmptyString
                                                ? AppStrings.NoInfo
                                                : controller
                                                    .detailSneaker.material,
                                            style: buildThemeData()
                                                .textTheme
                                                .bodyText1,
                                          )
                                        ],
                                      ),
                                    ),
                                    controller.detailSneaker.userAddAbout ==
                                                AppStrings.NullString ||
                                            controller.detailSneaker
                                                    .userAddAbout ==
                                                null ||
                                            controller.detailSneaker
                                                    .userAddAbout ==
                                                AppStrings.EmptyString
                                        ? Text("Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                                                style: buildThemeData()
                                                    .textTheme
                                                    .headline1)
                                            .paddingOnly(top: 16, left: 10)
                                        : Text(
                                                controller
                                                    .detailSneaker.userAddAbout,
                                                style: buildThemeData()
                                                    .textTheme
                                                    .headline1)
                                            .paddingOnly(top: 16, left: 10)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                )));
      })),
      appBar: getAppBar(context, nc),
      backgroundColor: background,
    );
  }
}
