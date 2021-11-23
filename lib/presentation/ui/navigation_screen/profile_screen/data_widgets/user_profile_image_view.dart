import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/profile_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

Widget userProfileImageView(UserModel user, ProfileController pc) {
  return Center(
      child: Row(children: [
    Stack(
      children: [
        // Padding(padding: const EdgeInsets.all(8.0),child:
        // ClipRRect(
        //   borderRadius:  BorderRadius.circular(50),
        //   child:
        //   user.image == null ||
        //       user.image == AppStrings.NullString ||
        //       user.image == AppStrings.EmptyString
        //       ? const AssetImage(SplashLogo):
        //   Image.network(user.image,
        //     loadingBuilder: (context, child, loadingProgress) {
        //       if (loadingProgress == null) {
        //         return child;
        //       }
        //       return SizedBox(
        //           width: 150,
        //           height: 150,
        //           child: getProgress());
        //     },
        //     frameBuilder: (context, child, progress, ready) {
        //       return child;
        //     },
        //   )
        // )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: background,
            backgroundImage: user.image == null ||
                    user.image == AppStrings.NullString ||
                    user.image == AppStrings.EmptyString
                ? const AssetImage(SplashLogo)
                : NetworkImage(
                    user.image),
            radius: 70,
          ),
        ),
        Positioned(
            bottom: 5,
            right: 10,
            child: Container(
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: forButtons),
                child: IconButton(
                  iconSize: 25.0,
                  onPressed: () async {
                    await pc.uploadImage();
                  },
                  icon: const Icon(Icons.add, color: whiteThings),
                ))),
      ],
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: RichText(
            text: TextSpan(
                text: user.firstName == null ||
                        user.firstName == AppStrings.NullString ||
                        user.firstName == AppStrings.EmptyString
                    ? AppStrings.NoInfo
                    : user.firstName,
                style: buildThemeData().textTheme.headline6,
                children: <TextSpan>[
              TextSpan(
                  text: user.secondName == null ||
                          user.secondName == AppStrings.NullString ||
                          user.secondName == AppStrings.EmptyString
                      ? " " + AppStrings.NoInfo
                      : " " + user.secondName,
                  style: buildThemeData().textTheme.headline6)
            ])),
      ),
    ),
  ]));
}
