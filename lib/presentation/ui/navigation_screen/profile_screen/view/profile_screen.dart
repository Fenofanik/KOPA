import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/data_widgets/profile_info_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/data_widgets/profile_singOut_button.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/data_widgets/user_profile_image_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController pc = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body:
      SafeArea(child: GetBuilder<ProfileController>(builder: (controller) {
        return Column(children: [
          userProfileImageView(pc.currentUser, pc),
          profileInfoView(pc.currentUser),
          Expanded(child: profileSignOutButton(pc))
        ]);
      })),
    );
  }
}
