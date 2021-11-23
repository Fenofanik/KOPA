import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/utils/utils.dart';

Widget profileInfoView(UserModel user) {
  return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(AppStrings.ContactInfo, style: buildThemeData().textTheme.headline2),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            user.phone == null ||
                user.phone == AppStrings.NullString ||
                user.phone == AppStrings.EmptyString
                ? AppStrings.NoInfo
                : user.phone,
            style: buildThemeData().textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: buildDivider(),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppStrings.City, style: buildThemeData().textTheme.headline2),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              user.city == null ||
                  user.city == AppStrings.NullString ||
                  user.city == AppStrings.EmptyString
                  ? AppStrings.NoInfo
                  : user.city,
              style: buildThemeData().textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: buildDivider(),
          )
        ])
      ]));
}