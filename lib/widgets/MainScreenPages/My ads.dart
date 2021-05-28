import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/UserCreateMoreInfo.dart';

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
    final String userId = firebaseServices.getUserId();
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
                  FutureBuilder<QuerySnapshot>(
                    future: firebaseServices.userRef.doc(userId).collection("userAdd").get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          backgroundColor: ThemeManager.background,
                          body: Center(
                            child: Text("Error: ${snapshot.error}"),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return  ListView(
                          children: snapshot.data.docs.map((document) {
                            return myProductsUI(context, document);
                          }).toList(),
                        );
                      }
                      return Scaffold(
                        backgroundColor: ThemeManager.background,
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),

                  Center(
                    child: Text(
                      'Архів',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
  Widget myProductsUI(BuildContext context, DocumentSnapshot document) {
    final double radius = 22;

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserCreateMoreInfo(productId: document.id)));
        },
        child: Stack(children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(color: ThemeManager.background),
            child: Padding(
              padding: EdgeInsets.only(top: 1, left: 10, bottom: 4, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: ThemeManager.containerColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius),
                          child: FittedBox(
                            child: Image.network(document['userAddImg']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, left: 10, bottom: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 24,
                                alignment: Alignment.centerLeft,
                                child: Text(document['userAddModel'],
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: ThemeManager.whiteThings,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Container(
                                height: 16,
                                alignment: Alignment.bottomLeft,
                                child: Text(" Розміри стопи: ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeManager.whiteThings,
                                        fontWeight: FontWeight.w100)),
                              ),
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 7, left: 4, bottom: 2, right: 6),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 40,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        document['userAddSize'],
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: ThemeManager.textSize,
                                                            fontWeight:
                                                            FontWeight
                                                                .w100),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 8,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            document['userAddSizeLength'],
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ThemeManager.whiteThings,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 6,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            document['userAddSizeWidth'],
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ThemeManager.whiteThings,
                                                                fontWeight: FontWeight.w100),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(top: 5),
                                                child: Container(
                                                  height: 18,
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        width: 40,
                                                        alignment:
                                                        Alignment.topCenter,
                                                        child: Text(
                                                          "EU",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                              ThemeManager.whiteThings,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w100),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                              "Довжина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: ThemeManager.whiteThings,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 6,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                              "Ширина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: ThemeManager.whiteThings,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 16,
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Text(" Матеріал : ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: ThemeManager.textMaterial,
                                              fontWeight: FontWeight.w100)),
                                      Text(
                                        document['userAddMaterial'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ThemeManager.textMaterial),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        flex: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: ThemeManager.boxPriceColor),
                  height: 30,
                  width: 74,
                  child: Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text("${document['userAddPrice']} \$",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ThemeManager.textPrice,
                              fontSize: 16, fontWeight: FontWeight.w700))),
                )),
          ]),
        ]));
  }
}