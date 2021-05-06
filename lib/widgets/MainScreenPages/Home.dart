import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopamain/widgets/MainScreenPages/MainScreen.dart';
import 'package:kopamain/widgets/MainScreenPages/My ads.dart';
import 'package:kopamain/widgets/MainScreenPages/Favorites.dart';
import 'package:kopamain/widgets/MainScreenPages/Profile.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  Widget mainScreen = MainScreen();
  Widget myScreen = MyScreenMain();
  Widget favoriteScreen = FavoritesScreenMain();
  Widget profileScreen = ProfileScreenMain();

  @override
  Widget build(BuildContext context) {
    final placeholder= Opacity(opacity :  0,
        child: IconButton(icon: Icon(Icons.cloud_done),onPressed: null));
    return Scaffold(
      backgroundColor: Colors.black,
      body: this.getBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff505051),
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/MainScreen.svg',
                  color: selectedIndex == 0 ? Colors.blue : Colors.grey),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/Sneaker.svg',
                  color: selectedIndex == 1 ? Colors.blue : Colors.grey),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color: selectedIndex == 2 ? Colors.blue : Colors.grey),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: selectedIndex == 3 ? Colors.blue : Colors.grey),
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
