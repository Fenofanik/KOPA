import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/view/detail_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

import '../main_screen_controller.dart';

class MainScreen1 extends StatelessWidget {
  final MainScreenController msc = Get.put(MainScreenController());
  final UserFavoriteController ufc = Get.put(UserFavoriteController());
  // final UserFavoriteController ufc = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.loading
              ? getProgress()
              : RefreshIndicator(
                  key: controller.refreshIndicatorKey,
                  onRefresh: () async {
                    await controller.getAllSneakers();
                  },
                  child: SingleChildScrollView(
                      child: Column(
                          children: controller.sneakers
                              .map((e) => productsUI(e, controller))
                              .toList()))),
        ),
        backgroundColor: ThemeManager.background,
      );
    });
  }

  Widget productsUI(SneakerModel sneaker, MainScreenController controller) {
    return InkWell(
        onTap: () {
          controller.currentSneaker = sneaker;
          print("${controller.currentSneaker.toJson()}");
          controller.isMainScreen = false;
          Get.to(() => DetailScreen(sneakerModel: sneaker));
        },
        child: Stack(children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(color: ThemeManager.background),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 1, left: 10, bottom: 4, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: ThemeManager.containerColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(44),
                          child: FittedBox(
                            child: sneaker.image.isEmpty
                                ? Icon(Icons.camera_alt_outlined,
                                    color: ThemeManager.forButtons)
                                : Image.network(sneaker.image[0]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, left: 10, bottom: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 24,
                                alignment: Alignment.centerLeft,
                                child: Text(sneaker.brand,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: ThemeManager.whiteThings,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Container(
                                height: 16,
                                alignment: Alignment.bottomLeft,
                                child: Text(" Розміри стопи: ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeManager.whiteThings,
                                        fontWeight: FontWeight.w100)),
                              ),
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 7, left: 4, bottom: 2, right: 6),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 40,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        sneaker.size,
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: ThemeManager
                                                                .textSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 8,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            sneaker.size,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ThemeManager
                                                                    .whiteThings,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 6,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            sneaker.width,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ThemeManager
                                                                    .whiteThings,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Container(
                                                  height: 18,
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        width: 40,
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          "EU",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: ThemeManager
                                                                  .whiteThings,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                              "Довжина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: ThemeManager
                                                                      .whiteThings,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 6,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                              "Ширина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: ThemeManager
                                                                      .whiteThings,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 16,
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Text(" Матеріал : ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: ThemeManager.textMaterial,
                                              fontWeight: FontWeight.w100)),
                                      Text(
                                        sneaker.material,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ThemeManager.textMaterial),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        flex: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: sneaker.sold
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.height / 19,
                        width: Get.width / 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: ThemeManager.forSold),
                        child: Text(
                          "Продано",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11, color: ThemeManager.whiteThings),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.favorite,
                          color: controller.currentUser.favorite.any(
                                  (element) => element == sneaker.id.trim())
                              ? ThemeManager.redThings
                              : whiteThings),
                      onPressed: () async {
                        msc.updateUserFavorites(sneaker);
                        ufc.getCurrentUserById();
                        ufc.getFavoriteSneakers();
                        // controller.update();
                      })),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: ThemeManager.boxPriceColor),
                  height: 30,
                  width: 74,
                  child: Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(sneaker.price,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ThemeManager.textPrice))),
                )),
          ]),
        ]));
  }
}
