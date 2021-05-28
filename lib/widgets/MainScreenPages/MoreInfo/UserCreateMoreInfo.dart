import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/ImageSwipe.dart';

class UserCreateMoreInfo extends StatefulWidget {
  final productId;

  UserCreateMoreInfo({this.productId});

  @override
  UserCreateMoreInfoState createState() => UserCreateMoreInfoState();
}

class UserCreateMoreInfoState extends State<UserCreateMoreInfo> {
  FirebaseServices firebaseServices = FirebaseServices();
  Color favoriteIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: StreamBuilder<QuerySnapshot>(
              stream: firebaseServices.userRef.snapshots(),
              builder: (context, userSnapshot) {
                if (userSnapshot.hasError) {
                  return Scaffold(
                    backgroundColor: ThemeManager.background,
                    body: Center(
                      child: Text("Error: ${userSnapshot.error}"),
                    ),
                  );
                }
                if (userSnapshot.connectionState == ConnectionState.active) {
                  final userId = firebaseServices.getUserId();
                  return ListView(
                    children: userSnapshot.data.docs.map((document) {
                      return userCreateMoreInfoUI(context, document);
                    }).toList(),
                  );
                }
                return Scaffold(
                  backgroundColor: ThemeManager.background,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
      ),

      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget userCreateMoreInfoUI(
      BuildContext context, DocumentSnapshot document) {
    List imageList = document['userCreate'];
    final double radius = 22;
    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(color: ThemeManager.background),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: EdgeInsets.all(1),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    color: Color(0xff343434),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            flex: 5,
                            child: ImageSwipe(
                              imageList: imageList,
                            )),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10, left: 1, bottom: 8, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(22),
                                                  color: Color(0xffFFD600)),
                                              height: 30,
                                              width: 74,
                                              child: Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 7),
                                                  child: Text(document['"userAddPrice"'],
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .w700))),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 190),
                                            child: IconButton(
                                                icon:  SvgPicture.asset('assets/images/pencil.svg',
                                                    height: 42,
                                                    color: Colors.white),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                                )),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Container(
                                    height: 24,
                                    alignment: Alignment.centerLeft,
                                    child: Text(document['userAddModel'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Container(
                                    height: 16,
                                    //color: Colors.green,
                                    alignment: Alignment.bottomLeft,
                                    child: Text(" Розміри стопи: ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100)),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, bottom: 2, right: 6),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 40,
                                                  alignment:
                                                  Alignment.bottomCenter,
                                                  child: Text(
                                                    document['userAddSize'],
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors
                                                            .blueAccent[100],
                                                        fontWeight:
                                                        FontWeight.w100),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100,
                                                  alignment:
                                                  Alignment.bottomCenter,
                                                  child: Text(
                                                    document['userAddSizeLength'],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w100),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100,
                                                  alignment:
                                                  Alignment.bottomCenter,
                                                  child: Text(
                                                    document['userAddSizeWidth'],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                              height: 18,
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 40,
                                                    alignment:
                                                    Alignment.topCenter,
                                                    child: Text(
                                                      "EU",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w100),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    alignment:
                                                    Alignment.topCenter,
                                                    child: Text(
                                                      "Довжина/см",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w100),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    alignment:
                                                    Alignment.topCenter,
                                                    child: Text(
                                                      "Ширина/см",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w100),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Container(
                                      height: 16,
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(" Матеріал : ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff9A9A9A),
                                                  fontWeight: FontWeight.w100)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              document['userAddMaterial'],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff9A9A9A)),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16, left: 10),
                                  child: Container(
                                    child: Text(
                                        document ['userAddAbout'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffABB4BD))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              child: Text("Видалити оголошення",
                                style: TextStyle(fontSize: 16,color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                primary: Color(0xff0CCDE6),
                              ),
                              onPressed: (){},
                            )),
                      ],
                    ),
                  ),
                ))));
  }
}