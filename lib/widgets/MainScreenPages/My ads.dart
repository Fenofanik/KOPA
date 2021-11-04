import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MainScreen.dart';


class MyScreenMain extends StatefulWidget {
  @override
  MyScreenMainState createState() => MyScreenMainState();
}

class MyScreenMainState extends State<MyScreenMain>
    with SingleTickerProviderStateMixin{
  FirebaseServices firebaseServices = FirebaseServices();
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2,vsync: this );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body:  Padding(
        padding: const EdgeInsets.only(left: 10,right:10),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/15,
              decoration: BoxDecoration(
                color: ThemeManager.background,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                border: Border.all(color: ThemeManager.myAddBorder)
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: ThemeManager.forButtons,
                ),
                labelColor: ThemeManager.whiteThings,
                unselectedLabelColor: ThemeManager.whiteThings,
                tabs: [
                  Tab(
                    text: 'Активні',
                  ),
                  Tab(
                    text: 'Архів',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MainScreen(productId: 1,isFavorite: false,isMyProduct: true,isSold: false),
                  MainScreen(productId: 1,isFavorite: false,isMyProduct: true,isSold: true),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        automaticallyImplyLeading: false,
      ),
    );
  }
}