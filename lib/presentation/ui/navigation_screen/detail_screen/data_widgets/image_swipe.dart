import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../detail_screen_controller.dart';

class ImageSwipe extends BaseStatelessScreen {
  // final DetailScreenController dsc = Get.find();
  final List imageList;

  ImageSwipe({this.imageList});

  final double radius = 22;

  @override
  Widget buildBody(BuildContext context) {
    return
      GetBuilder<DetailScreenController>(builder: (controller){
        return Stack(
          children: [
            PageView(
              onPageChanged: (num) {
                controller.selectedImage = num;
                controller.update();
              },
              children: [
                for (var i = 0; i < imageList.length; i++)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: FittedBox(
                      child: Image.network("${imageList[i]}"),
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var i = 0; i < imageList.length; i++)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.selectedImage == i
                              ? whiteThings
                              : ThemeManager.foreImgSwipe),
                      height: 8,
                      width: 8,
                    ),
                ],
              ),
            )
          ],
        );
      });

  }

  @override
  Widget buildFloatingButton(BuildContext context) {
    return null;
  }

  @override
  Widget buildFooter(BuildContext context) {
    return null;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return null;
  }

}

