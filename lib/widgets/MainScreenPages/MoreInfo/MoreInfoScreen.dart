import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/Models/ProductModel.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/ImageSwipe.dart';
import 'package:kopamain/widgets/MainScreenPages/UserCreate.dart';


class MoreInfo extends StatefulWidget {
  final productId;

  MoreInfo({this.productId});

  @override
  MoreInfoState createState() => MoreInfoState();
}

class MoreInfoState extends State<MoreInfo> {
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: FutureBuilder<QuerySnapshot>(
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
                    productsSnapshot.connectionState == ConnectionState.done) {
                  final userId = firebaseServices.getUserId();
                  final user = userSnapshot.data.docs.firstWhere((element) {
                    return element['id'] == userId;
                  });
                  final userFavs = List<String>.from(user['favs']);

                  final prodData = productsSnapshot.data.docs.where((element) =>
                      element['id'].toString().trim() == widget.productId);

                  return ListView(
                    children: prodData.map((document) {
                      return moreInfoUI(context, document, userFavs, userId);
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
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeManager.whiteThings,
            size: 14,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget moreInfoUI(BuildContext context, DocumentSnapshot document,
      List<String> favs, String userId) {
    List imageList = document['image'];

    String authorId = document["author"];
    String addAbout = document["userAddAbout"];

    final double radius = 22;
    final shape =  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
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
                    color: ThemeManager.containerColor,
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
                                                  color: ThemeManager
                                                      .boxPriceColor),
                                              height: 30,
                                              width: 74,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7),
                                                  child: Text(document['price'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ThemeManager
                                                              .textPrice,
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
                                            child: authorId == userId?IconButton(
                                                icon: Icon(
                                                  Icons.create_outlined,
                                                  size: 42,
                                                  color: ThemeManager
                                                      .whiteThings,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => UserCreate(product: ProductModel(
                                                              author: document["author"].toString(),
                                                            brand:document["brand"].toString(),
                                                            id:document["id"].toString(),
                                                            image: List<String>.from(imageList),
                                                            length:document["length"].toString(),
                                                            material:document["material"].toString(),
                                                            price:document["price"].toString(),
                                                            size:document["size"].toString(),
                                                            sold:document["sold"],
                                                            width:document["width"].toString(),
                                                              userAddAbout:document["userAddAbout"].toString(),
                                                          ))));
                                                }):IconButton(
                                                icon:Icon(Icons.favorite,
                                                    size: 42,
                                                    color: favs.contains(
                                                        document.id)
                                                        ? ThemeManager
                                                        .redThings
                                                        : ThemeManager
                                                        .whiteThings),
                                                onPressed: () async {
                                                  await firebaseServices
                                                      .updateUserFavs(
                                                      document.id, favs);
                                                }),),

                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Container(
                                    height: 24,
                                    alignment: Alignment.centerLeft,
                                    child: Text(document['brand'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: ThemeManager.whiteThings,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(" Розміри стопи: ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ThemeManager.whiteThings,
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
                                                    document['size'],
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: ThemeManager
                                                            .textSize,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    document['length'],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: ThemeManager
                                                            .whiteThings,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                ),
                                                Container(
                                                  width: 100,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    document['width'],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: ThemeManager
                                                            .whiteThings,
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
                                                          color: ThemeManager
                                                              .whiteThings,
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
                                                          color: ThemeManager
                                                              .whiteThings,
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
                                                          color: ThemeManager
                                                              .whiteThings,
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

                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(" Матеріал : ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color:
                                                      ThemeManager.textMaterial,
                                                  fontWeight: FontWeight.w100)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              document['material'],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: ThemeManager
                                                      .textMaterial),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16, left: 10),
                                  child: Container(
                                    child:
                                    addAbout==""?
                                    Text(
                                        "Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: ThemeManager.forTextAbout)):
                                    Text(document["userAddAbout"],style: TextStyle(
                                        fontSize: 12,
                                        color: ThemeManager.forTextAbout)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child:
                            authorId==userId?
                            Container(
                              color: ThemeManager.background,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 45,right: 45,top: 10,bottom: 10),
                                child: Container(
                                  child: document['sold'] ? ElevatedButton(
                                    onPressed: (){
                                      _showDelete(document);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape:  shape,
                                      primary: ThemeManager.forButtons,
                                    ),
                                    child: Text("Видалити з архіву",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
                                  ): ElevatedButton(
                                    onPressed: (){
                                      _showMyDialog(document);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape:  shape,
                                      primary: ThemeManager.forButtons,
                                    ),
                                    child: Text("Видалити оголошення",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
                                  ),
                                ),
                              ),
                            ):
                            Container(
                                color: ThemeManager.background,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        height: 61,
                                        child:
                                            Image.asset('assets/images/4.png')),
                                    Padding(
                                      padding: EdgeInsets.only(left: 13),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Продавець",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color:
                                                    ThemeManager.whiteThings),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 30),
                                            child: Text(
                                              "Ukraine, Vinnytsia",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color:
                                                      ThemeManager.whiteThings),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 70),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: FloatingActionButton(
                                                    onPressed: () {
                                                      _showSellerPhone();
                                                    },
                                                    backgroundColor:
                                                        ThemeManager
                                                            .phoneButtonSell,
                                                    child: Icon(
                                                      Icons.phone,
                                                      color: ThemeManager
                                                          .blackThings,
                                                      size: 28,
                                                    ),
                                                  ))
                                            ])),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ))));
  }

  Future<void> _showMyDialog(DocumentSnapshot document) async {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: shape,
          backgroundColor: ThemeManager.containerColor,
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Ви впевнені, що',style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings),),
                Text('хочете видалити?',style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings)),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: shape,
                      padding: EdgeInsets.only(left: 50, right: 50),
                      primary: ThemeManager.forButtons,
                    ),
                    child: Text("Ні",
                        style:
                        TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
                    onPressed: ()  {
                      Navigator.of(context).pop();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: shape,
                      padding: EdgeInsets.only(left: 50, right: 50),
                      primary: ThemeManager.forButtons,
                    ),
                    child: Text("Так",
                        style:
                        TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
                  onPressed: ()async{
                    await firebaseServices.productRef.doc(document['id']).update({
                      "sold":true
                    });
                    Navigator.pushNamed(context, '/Home');

                  },),
              ),
            ],)
          ],
        );
      },
    );
  }

  Future<void> _showDelete(DocumentSnapshot document) async {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: shape,
          backgroundColor: ThemeManager.containerColor,
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Ви впевнені, що',style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings),),
                Text('хочете видалити?',style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings)),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: shape,
                        padding: EdgeInsets.only(left: 50, right: 50),
                        primary: ThemeManager.forButtons,
                      ),
                      child: Text("Ні",
                          style:
                          TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
                      onPressed: ()  {
                        Navigator.of(context).pop();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: shape,
                      padding: EdgeInsets.only(left: 50, right: 50),
                      primary: ThemeManager.forButtons,
                    ),
                    child: Text("Так",
                        style:
                        TextStyle(fontSize: 14, color: ThemeManager.whiteThings)),
                    onPressed: ()async{
                      await firebaseServices.productRef.doc(document['id']).delete();
                      Navigator.pushNamed(context, '/Home');

                    },),
                ),
              ],)
          ],
        );
      },
    );
  }

  Future<void> _showSellerPhone() async {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: shape,
          backgroundColor: ThemeManager.containerColor,
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextButton(
                    child: Text('Контактний номер ',
                      style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings)),
                onPressed: Navigator.of(context).pop,
                ),
                TextButton(child: Text('+380938888888',style: TextStyle(fontSize: 24,color: ThemeManager.whiteThings)),
                onPressed: Navigator.of(context).pop,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
