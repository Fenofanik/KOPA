import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/container_borders.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import '../user_create_screen_controller.dart';

Widget userCreateProductView(BuildContext context, UserCreateScreenController controller) {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width, maxHeight: Get.height),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: containerColor,
              margin: const EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [...(controller.getPhotos().values.toList())],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                color: background,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: allPadding3,
                      color: background,
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: allPadding3, child: buildCircleIcon()),
                          Padding(
                            padding: allPadding3,
                            child: Text(
                              AppStrings.Size,
                              style: buildThemeData().textTheme.headline2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: containerColor,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                    height: Get.height / 4,
                                    child: Image.asset(sneakerSizesModel)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        margin: allPadding,
                                        decoration: forUserCreateBottom,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                margin: allPadding2,
                                                decoration: forUserCreateRight,
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      AppStrings.Size,
                                                      style: buildThemeData()
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        AppStrings.EU,
                                                        style: buildThemeData()
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: controller
                                                            .updateSneaker !=
                                                        null
                                                    ? controller.theSizeUpdate
                                                    : controller.theSize,
                                                validator:
                                                    controller.validationEmptyField,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      paddingForCreateScreenTextFields,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  hintText:
                                                      AppStrings.someThinks,
                                                  hintStyle: buildThemeData()
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                style: buildThemeData()
                                                    .textTheme
                                                    .headline5,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: allPadding,
                                        decoration: forUserCreateBottom,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                margin: allPadding2,
                                                decoration: forUserCreateRight,
                                                child: Text(
                                                  AppStrings.LengthOf,
                                                  style: buildThemeData()
                                                      .textTheme
                                                      .headline5,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller:
                                                    controller.updateSneaker !=
                                                            null
                                                        ? controller
                                                            .sizeLengthUpdate
                                                        : controller.sizeLength,
                                                validator:
                                                    controller.validationEmptyField,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        paddingForCreateScreenTextFields,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    hintText:
                                                        AppStrings.someThinks,
                                                    hintStyle: buildThemeData()
                                                        .textTheme
                                                        .headline5),
                                                style: buildThemeData()
                                                    .textTheme
                                                    .headline5,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                              margin: allPadding,
                                              decoration: forUserCreateBottom,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      margin: allPadding2,
                                                      decoration:
                                                          forUserCreateRight,
                                                      child: Text(
                                                        AppStrings.WidthOf,
                                                        style: buildThemeData()
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      controller: controller
                                                                  .updateSneaker !=
                                                              null
                                                          ? controller
                                                              .sizeWidthUpdate
                                                          : controller
                                                              .sizeWidth,
                                                      validator: controller
                                                          .validationEmptyField,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            paddingForCreateScreenTextFields,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        hintText: AppStrings
                                                            .someThinks,
                                                        hintStyle:
                                                            buildThemeData()
                                                                .textTheme
                                                                .headline5,
                                                      ),
                                                      style: buildThemeData()
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: Container(
              color: background,
              child: TextFormField(
                  controller: controller.updateSneaker != null
                      ? controller.modelUpdate
                      : controller.model,
                  validator: controller.validationEmptyField,
                  decoration: InputDecoration(
                      labelText: AppStrings.Model,
                      labelStyle: buildThemeData().textTheme.headline2,
                      prefixIcon: buildCircleIcon()),
                  style: buildThemeData().textTheme.headline6),
            ),
          ),
          Expanded(
              child: Container(
            color: background,
            child: TextFormField(
                controller: controller.updateSneaker != null
                    ? controller.materialUpdate
                    : controller.material,
                validator: controller.validationEmptyField,
                decoration: InputDecoration(
                    labelText: AppStrings.Material,
                    labelStyle: buildThemeData().textTheme.headline2,
                    prefixIcon: buildCircleIcon()),
                style: buildThemeData().textTheme.headline6),
          )),
          Expanded(
              child: Container(
            color: background,
            child: TextFormField(
                controller: controller.updateSneaker != null
                    ? controller.aboutSneakerUpdate
                    : controller.aboutSneaker,
                validator: controller.validationEmptyField,
                decoration: InputDecoration(
                    labelText: AppStrings.About,
                    labelStyle: buildThemeData().textTheme.headline2,
                    prefixIcon: buildCircleIcon()),
                style: buildThemeData().textTheme.headline6),
          )),
          Expanded(
              child: Container(
            color: containerColor,
            child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.updateSneaker != null
                    ? controller.priceUpdate
                    : controller.price,
                validator: controller.validationEmptyField,
                decoration: InputDecoration(
                    labelText: AppStrings.Price,
                    labelStyle: buildThemeData().textTheme.headline2,
                    prefixIcon: buildCircleIcon()),
                style: buildThemeData().textTheme.headline6),
          )),
        ],
      ),
    ),
  );
}
