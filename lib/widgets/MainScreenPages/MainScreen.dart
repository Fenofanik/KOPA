import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/presentation/ui/logIn/logIn_controller.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/MoreInfoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  final productId;
  final bool isFavorite;
  final bool isSold;
  final bool isMyProduct;

  MainScreen({this.productId, this.isFavorite,this.isSold,this.isMyProduct});


  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final LoginController loginController = Get.find();
  FirebaseServices firebaseServices = FirebaseServices();
  TextEditingController filterBrand = TextEditingController();
  TextEditingController filterMaterial = TextEditingController();
  TextEditingController filterSize = TextEditingController();
  TextEditingController filterPrice = TextEditingController();

  @override
  void dispose() {
    filterBrand.dispose();
    filterMaterial.dispose();
    filterSize.dispose();
    filterPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: ThemeManager.background,
        body:
        FutureBuilder<QuerySnapshot>(
          future: firebaseServices.productRef.get(),
          builder: (context, productsSnapshot) {
            return StreamBuilder<QuerySnapshot>(
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
                  if (userSnapshot.connectionState == ConnectionState.active &&
                      productsSnapshot.connectionState ==
                          ConnectionState.done) {
                    final userId = firebaseServices.getUserId();
                    final user = userSnapshot.data.docs.firstWhere((element) {
                      return element['id'] == userId;
                    });
                    final userFavs = List<String>.from(user['favs']);

                    final productsData = widget.isFavorite
                        ? productsSnapshot.data.docs.where((element) {
                            final id = element['id'].toString().trim();
                            return userFavs.contains(id);
                          })
                        :
                    widget.isMyProduct == true ?
                    productsSnapshot.data.docs.where((element) {
                      final author = element['author'].toString().trim();
                      return author == userId && widget.isSold == element['sold'];
                    })
                    : productsSnapshot.data.docs
                    .where((element) {
                      if (filterBrand.text != null || filterBrand.text != "") {
                        return element["brand"].toString().trim().startsWith(filterBrand.text);

                      } else {
                        return true;
                      }
                    }
                    )
                        .where((element) {
                      if (filterMaterial.text != null || filterMaterial.text != "") {
                        return element["material"].toString().trim().startsWith(filterMaterial.text);

                      } else {
                        return true;
                      }
                    }
                    )
                        .where((element) {
                      if (filterSize.text != null || filterSize.text != "") {
                        return element["size"].toString().trim().startsWith(filterSize.text);


                      } else {
                        return true;
                      }
                    }
                    )
                        .where((element) {
                      if (filterPrice.text != null || filterPrice.text != "") {
                        return element["price"].toString().trim().startsWith(filterPrice.text);

                      } else {
                        return true;
                      }
                    }
                    );


                    return ListView(
                      children: productsData.map((document) {
                        return
                          productsUI(context, document, userFavs);
                      }).toList(),
                    );
                  }
                  return Scaffold(
                    backgroundColor: ThemeManager.background,
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                });
          },
        ),
        appBar: ( widget.isSold == true || widget.isMyProduct == true)?
        PreferredSize(preferredSize: Size(0.0, 0.0),child: Container(),):AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ThemeManager.background,
            leading:
            GestureDetector(
              onTap: () {},
              child: (widget.isFavorite || widget.isSold == true || widget.isMyProduct == true)
                  ? Container()
                  : Container(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                          icon: Icon(Icons.filter_list_alt, size: 16),
                          color: Colors.white,
                          onPressed: () {
                            filterAddButtonSheet(context);
                          })),
            )));
  }

  Widget productsUI(
      BuildContext context, DocumentSnapshot document, List<String> favs) {
    final double radius = 22;
    final isFavorite = favs.contains(document.id.trim());

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoreInfo(productId: document.id.trim())));
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
                            child:
                            document['image'].isEmpty?
                            Icon(Icons.camera_alt_outlined,color: ThemeManager.forButtons):
                            Image.network(document['image'][0]),

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
                                child: Text(document['brand'],
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
                                                        document['size'],
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
                                                            document['length'],
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
                                                            document['width'],
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ThemeManager.whiteThings,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
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
                                                              color: ThemeManager.whiteThings,
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
                                                                  fontWeight: FontWeight.w100),
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
                                        document['material'],
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: document['sold']?
                   Padding(
                     padding: const EdgeInsets.only(left: 10,top:20),
                     child: Container(
                       alignment: Alignment.center,
                       height: MediaQuery.of(context).size.height/19,
                       width: MediaQuery.of(context).size.width/5,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           color: ThemeManager.forSold),
                      child: Text("Продано",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11,
                            color: ThemeManager.whiteThings
                        ),
                      ),),
                   ):
              IconButton(
                  icon: Icon(Icons.favorite,
                      color: isFavorite ? ThemeManager.redThings: ThemeManager.whiteThings),
                  onPressed: () async {
                    await firebaseServices.updateUserFavs(document.id, favs);
                  })),
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
                      child: Text(document['price'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700,color: ThemeManager.textPrice))),
                )),
          ]),
        ]));
  }

  void filterAddButtonSheet(context) {
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
                            controller: filterBrand,
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
                            controller: filterMaterial,
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
                                    controller: filterSize,
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
                                    controller: filterPrice,
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
                                filterBrand.clear();
                                filterMaterial.clear();
                                filterSize.clear();
                                filterPrice.clear();
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
                                    setState(() {

                                    });
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
}
