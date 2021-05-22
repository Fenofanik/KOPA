import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';

import 'MoreInfo/MoreInfoScreen.dart';

class FavoritesScreenMain extends StatefulWidget {
  final productId;
  final bool isFavorite;
  FavoritesScreenMain({this.productId,this.isFavorite});
  @override
  FavoritesScreenMainState createState() => FavoritesScreenMainState();
}

class FavoritesScreenMainState extends State<FavoritesScreenMain> {
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: firebaseServices.productRef.doc(widget.productId).get(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Scaffold(
            backgroundColor: ThemeManager.background,
            body: Center(
              child: Text("Error: ${snapshot.error}"),),);}
          if(snapshot.connectionState==ConnectionState.done){
            return widget.isFavorite!=true?ListView(
              children: snapshot.data.data().docs(widget.productId).map((document){
                return productsUI(context, document);
              }).toList(),
            ):Container(child: Center(child: Text("ABOBA")),);
          }
          return Scaffold(
            backgroundColor: ThemeManager.background,
            body: Center(child: CircularProgressIndicator(),),);
        },

      ),
      backgroundColor: ThemeManager.background,
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget productsUI(BuildContext context, DocumentSnapshot document) {
    final double radius = 22;
    return InkWell(onTap: () {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => MoreInfo(productId: document.id,)));
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
                  color: Color(0xff343434),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius),
                          child: FittedBox(
                            child: Image.network(document['image'][0]),
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Container(
                                height: 16,
                                alignment: Alignment.bottomLeft,
                                child: Text(" Розміри стопи: ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
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
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Text(
                                                        document['size'],
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors
                                                                .blueAccent[100],
                                                            fontWeight:
                                                            FontWeight.w100),
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
                                                                color:
                                                                Colors.white,
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
                                                                color:
                                                                Colors.white,
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
                                                padding: EdgeInsets.only(
                                                    top: 5),
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
                                                              color: Colors
                                                                  .white,
                                                              fontWeight:
                                                              FontWeight.w100),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            alignment:
                                                            Alignment.topCenter,
                                                            child: Text(
                                                              "Довжина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                  Colors.white,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 6,
                                                          child: Container(
                                                            alignment:
                                                            Alignment.topCenter,
                                                            child: Text(
                                                              "Ширина/см",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                  Colors.white,
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
                                  child: Row(children: <Widget>[
                                    Text(" Матеріал : ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff9A9A9A),
                                            fontWeight: FontWeight.w100)),
                                    Text(document['material'], style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff9A9A9A)),)
                                  ],)

                              ),
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
              child: IconButton(icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {

                  }
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Color(0xffFFD600)),
                      height: 30, width: 74,
                      child: Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text('100 \$',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700))),
                    )),
              ]),
        ]));
  }
}
