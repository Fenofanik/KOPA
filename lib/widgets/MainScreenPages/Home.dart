import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';
import 'package:kopamain/widgets/MainScreenPages/MainScreen.dart';
import 'package:kopamain/widgets/MainScreenPages/My ads.dart';
import 'package:kopamain/widgets/MainScreenPages/Profile.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // final LoginController loginController = Get.find();
  int selectedIndex = 0;
  Widget mainScreen = MainScreen(productId: 1, isFavorite: false,isMyProduct: false,isSold: false);
  Widget myScreen = MyScreenMain();
  Widget favoriteScreen = MainScreen(productId: 1, isFavorite: true,isMyProduct: false,isSold: false);
  Widget profileScreen = ProfileScreenMain();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: this.getBody(),
      floatingActionButton: FloatingActionButton(
        child: Stack(
          children: [
            SvgPicture.asset('assets/images/PlusButton.svg',color: ThemeManager.forButtons),
            Positioned(
              left: 5,
                right: 5,
                top: 15,
                child: Icon(Icons.add)),
          ],
        ),
        backgroundColor: ThemeManager.bottomBarBack,
        onPressed: () {
          Navigator.pushNamed(context, '/UserCreate');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor:ThemeManager.bottomBarBack,
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/MainScreen.svg',
                  color: selectedIndex == 0 ? ThemeManager.forButtons : ThemeManager.bottomBarNotFocus),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset('assets/images/Sneaker.svg',
                    color: selectedIndex == 1 ? ThemeManager.forButtons : ThemeManager.bottomBarNotFocus),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.favorite,
                    color: selectedIndex == 2 ? ThemeManager.forButtons : ThemeManager.bottomBarNotFocus),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: selectedIndex == 3 ? ThemeManager.forButtons : ThemeManager.bottomBarNotFocus),
              label: "")
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this.mainScreen;
    }
    if (this.selectedIndex == 1) {
      return this.myScreen;
    }
    if (this.selectedIndex == 2) {
      return this.favoriteScreen;
    } else {
      return this.profileScreen;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}




