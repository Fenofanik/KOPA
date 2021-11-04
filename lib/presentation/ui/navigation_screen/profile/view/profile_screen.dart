import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/domain/models/user_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile/profile_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController pc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: SafeArea(
        child:
        GetBuilder<ProfileController>(builder: (controller){
          return   Column(children: [
            imageNameAndIcon(pc.currentUser),
            phoneText(pc.currentUser),
            cityText(pc.currentUser),
            Expanded(child: signOutButton())
          ]);
        })
      ),
    );
  }

  Widget imageNameAndIcon(UserModel user) {
    return Center(
        child: Row(children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  user.image == null || user.image == 'null' || user.image == ''
                      ? AssetImage("assets/images/2.png")
                      : NetworkImage(user.image),
              radius: 70,
            ),
          ),
          Positioned(
              bottom: 5,
              right: 10,
              child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ThemeManager.forButtons),
                  child: IconButton(
                    iconSize: 25.0,
                    onPressed: () async {
                      await pc.uploadImage();
                    },
                    icon: Icon(Icons.add, color: ThemeManager.whiteThings),
                  ))),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Text(
              user.firstName == null ||
                      user.firstName == 'null' ||
                      user.firstName == ''
                  ? 'No info'
                  : user.firstName,
              style: TextStyle(fontSize: 18, color: ThemeManager.whiteThings),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                user.secondName == null ||
                        user.secondName == 'null' ||
                        user.secondName == ''
                    ? 'No info'
                    : user.secondName,
                style: TextStyle(fontSize: 18, color: ThemeManager.whiteThings),
              ),
            )
          ],
        ),
      ),
    ]));
  }

  Widget phoneText(UserModel user) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Контактна інформація",
              style: TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              user.phone == null || user.phone == 'null' || user.phone == ''
                  ? 'No info'
                  : user.phone,
              style: TextStyle(fontSize: 18, color: ThemeManager.whiteThings),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: buildDivider(),
          ),
        ]));
  }

  Widget cityText(UserModel user) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Місто",
              style: TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              user.city == null || user.city == "null" || user.city == ''
                  ? 'No info'
                  : user.city,
              style: TextStyle(fontSize: 18, color: ThemeManager.whiteThings),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: buildDivider(),
          )
        ]));
  }

  Widget signOutButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Center(
          widthFactor: Get.width,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.only(left: 120, right: 120),
                primary: ThemeManager.forButtons,
              ),
              child: Text("Вийти",
                  style:
                      TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
              onPressed: () async {
                await pc.signOut();
              })),
    );
  }
}
