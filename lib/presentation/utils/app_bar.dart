

import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';

final MainScreenController msc = Get.find();

AppBar getAppBar(BuildContext context) {
  return AppBar(
    // leading: BackButton(),
    backgroundColor: ThemeManager.bottomBarBack,
      leading:
      msc.isMainScreen?
      Container(
          alignment: Alignment.bottomLeft,
          child: IconButton(
              icon: Icon(Icons.filter_list_alt),
              color: Colors.white,
              onPressed: () {
                filterAddButtonSheet(context,msc);
              })):
          IconButton(onPressed: (){
            msc.isMainScreen = true;
            msc.update();
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios))

  );
}

void filterAddButtonSheet(context,MainScreenController controller) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: ThemeManager.filterBack,
          height: MediaQuery.of(context).size.height * 45,
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 27,
                              color: ThemeManager.blackThings,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                            controller:  controller.searchController,
                                // controller: controller.filterBrand,
                                decoration: InputDecoration(
                                  labelText: "Модель",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: ThemeManager.whiteThings),
                                  prefixIcon: Icon(
                                    Icons.circle,
                                    size: 9,
                                    color: ThemeManager.forButtons,
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: (14), color: ThemeManager.whiteThings)),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                                controller: controller.searchController,
                                decoration: InputDecoration(
                                  labelText: "Матеріал",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: ThemeManager.whiteThings),
                                  prefixIcon: Icon(
                                    Icons.circle,
                                    size: 9,
                                    color: ThemeManager.forButtons,
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: (14), color: ThemeManager.whiteThings)),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 250),
                                        child: TextField(
                                            controller: controller.searchController,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              labelText: "Розмір",
                                              labelStyle: TextStyle(
                                                  fontSize: 14, color: ThemeManager.whiteThings),
                                              prefixIcon: Icon(
                                                Icons.circle,
                                                size: 9,
                                                color: ThemeManager.forButtons,
                                              ),
                                            ),
                                            style: TextStyle(
                                                fontSize: (14), color: ThemeManager.whiteThings)),
                                      ),
                                      flex: 7),
                                ],
                              ))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 250),
                                        child: TextField(
                                            controller: controller.searchController,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              labelText: "Ціна",
                                              labelStyle: TextStyle(
                                                  fontSize: 14, color: ThemeManager.whiteThings),
                                              prefixIcon: Icon(
                                                Icons.circle,
                                                size: 9,
                                                color: ThemeManager.forButtons,
                                              ),
                                            ),
                                            style: TextStyle(
                                                fontSize: (14), color: ThemeManager.whiteThings)),
                                      ),
                                      flex: 7),
                                ],
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 20),
                            child: TextButton(
                                onPressed: () {
                                  // controller.clearAllControllers();
                                },
                                child: Text(
                                  'СКИНУТИ',
                                  style:
                                  TextStyle(fontSize: 12, color: ThemeManager.forButtons),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 20),
                            child: Container(
                                margin: EdgeInsets.only(right: 15),
                                child: TextButton(
                                    onPressed: () {
                                      controller.update();
                                    },
                                    child: Text(
                                      'ЗАСТОСУВАТИ',
                                      style: TextStyle(
                                          fontSize: 12, color: ThemeManager.forButtons),
                                    ))),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              )),
        );
      });
}