
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/presentation/utils/utils.dart';

import '../detail_screen_controller.dart';


Widget detailImageSwipeView(List imageList, DetailScreenController controller) {
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
              borderRadius: BorderRadius.circular(22),
              child: FittedBox(
                child: Image.network(imageList[i],
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SizedBox(
                        width: 300,
                        height: 300,
                        child: getProgress());
                  },
                  frameBuilder: (context, child, progress, ready) {
                    return child;
                  },
                ),
                // fit: BoxFit.fill,
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    shape:  BoxShape.circle,
                    color: controller.selectedImage == i
                        ? forButtons
                        : foreImgSwipe),
                height: 8,
                width: 8,
              ),
          ],
        ),
      )
    ],
  );
}