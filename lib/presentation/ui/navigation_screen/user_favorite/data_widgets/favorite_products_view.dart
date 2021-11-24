import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/container_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/view/detail_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

import '../../navigation_screen_controller.dart';
import '../user_favorite_controller.dart';

Widget favoriteProductsView(
    SneakerModel sneaker,
    UserFavoriteController controller,
    NavigationController nc,
    MainScreenController msc) {
  return InkWell(
      borderRadius: listSneakerBorder3,
      splashColor: forButtons,
      onTap: () {
        controller.currentSneaker = sneaker;
        nc.isMainScreen = false;
        nc.isFavoriteScreen = false;
        nc.isUserProductScreen = false;
        nc.isProfileScreen = false;
        Get.to(() => DetailScreen(sneakerModel: sneaker));
      },
      child: Stack(children: <Widget>[
        Container(
          height: Get.height / 4.5,
          margin: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
          decoration: BoxDecoration(
            borderRadius: listSneakerBorder3,
            color: containerColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: listSneakerBorder3,
                  child: FittedBox(
                    child: sneaker.image.isEmpty
                        ? const Icon(Icons.camera_alt_outlined,
                            color: forButtons)
                        : Image.network(
                            sneaker.image[0],
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: getProgress());
                            },
                            frameBuilder: (context, child, progress, ready) {
                              return child;
                            },
                          ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 10, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                          sneaker.brand == null ||
                                  sneaker.brand == AppStrings.NullString ||
                                  sneaker.brand == AppStrings.EmptyString
                              ? AppStrings.NoInfo
                              : sneaker.brand,
                          style: buildThemeData().textTheme.bodyText2),
                      Text(AppStrings.TheSizeOfTheFoot,
                          style: buildThemeData().textTheme.headline2),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    sneaker.size == null ||
                                            sneaker.size ==
                                                AppStrings.NullString ||
                                            sneaker.size ==
                                                AppStrings.EmptyString
                                        ? AppStrings.NoInfo
                                        : sneaker.size,
                                    style:
                                        buildThemeData().textTheme.headline6),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    AppStrings.EU,
                                    style: buildThemeData().textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    sneaker.length == null ||
                                            sneaker.length ==
                                                AppStrings.NullString ||
                                            sneaker.length ==
                                                AppStrings.EmptyString
                                        ? AppStrings.NoInfo
                                        : sneaker.length,
                                    style: buildThemeData().textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      AppStrings.LengthOf,
                                      style:
                                          buildThemeData().textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    sneaker.width == null ||
                                            sneaker.width ==
                                                AppStrings.NullString ||
                                            sneaker.width ==
                                                AppStrings.EmptyString
                                        ? AppStrings.NoInfo
                                        : sneaker.width,
                                    style: buildThemeData().textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      AppStrings.WidthOf,
                                      style:
                                          buildThemeData().textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 5),
                        child: Row(
                          children: [
                            Text(AppStrings.Material + ': ',
                                style: buildThemeData().textTheme.overline),
                            Text(
                              sneaker.material == null ||
                                      sneaker.material ==
                                          AppStrings.NullString ||
                                      sneaker.material == AppStrings.EmptyString
                                  ? AppStrings.NoInfo
                                  : sneaker.material,
                              style: buildThemeData().textTheme.bodyText1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                          borderRadius: forSoldContainer, color: forSold),
                      child: Text(
                        AppStrings.Sold,
                        textAlign: TextAlign.center,
                        style: buildThemeData().textTheme.subtitle1,
                      ),
                    ),
                  )
                : IconButton(
                splashColor: transparent,
                splashRadius: 8,
                    icon: Icon(Icons.favorite,
                        color: controller.currentUser.favorite
                                .any((element) => element == sneaker.id.trim())
                            ? redThings
                            : whiteThings),
                    onPressed: () async {
                      controller.updateUserFavorites(sneaker);
                      msc.onInit();
                      controller.update();
                    })),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: listSneakerBorder2, color: boxPriceColor),
                height: 30,
                width: 74,
                child: Center(
                  child: Text(
                      sneaker.price == null ||
                              sneaker.price == AppStrings.NullString ||
                              sneaker.price == AppStrings.EmptyString
                          ? AppStrings.NoInfo
                          : sneaker.price + '\$',
                      textAlign: TextAlign.center,
                      style: buildThemeData().textTheme.subtitle2),
                ),
              )),
        ]),
      ]));
}
