import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/ImageSwipe.dart';

class MoreInfo extends StatefulWidget {
  final productId;
  MoreInfo({this.productId});
  @override
  MoreInfoState createState() => MoreInfoState();
}

class MoreInfoState extends State<MoreInfo> {
  FirebaseServices firebaseServices = FirebaseServices();
  Color favoriteIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: FutureBuilder(
        future: firebaseServices.productRef.doc(widget.productId).get(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Scaffold(
            backgroundColor: ThemeManager.background,
            body: Center(
              child: Text("Error: ${snapshot.error}"),),);}
          if(snapshot.connectionState==ConnectionState.done){
            Map<String, dynamic> documentData = snapshot.data.data();
            return ListView(
              children:[
                moreInfoUI(context,documentData)
              ]
            );
          }
          return Scaffold(
            backgroundColor: ThemeManager.background,
            body: Center(child: CircularProgressIndicator(),),);
        },

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
  Widget moreInfoUI (BuildContext context,  documentData){
    List imageList = documentData['image'];
    final double radius = 22;
    return SingleChildScrollView(child :Container (
              decoration: BoxDecoration(color:ThemeManager.background),
              height: 750,
              child: Padding(padding: EdgeInsets.all(1),
                  child : Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child :Container (color: Color(0xff343434),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child : ImageSwipe(imageList: imageList,)
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 1, bottom: 8, right: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Row(children: <Widget>[
                                      Padding (
                                          padding: EdgeInsets.only(top:10,left: 10),
                                          child :Container (
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),
                                                color: Color(0xffFFD600)),
                                            height: 30,width: 74,
                                            child :Padding (
                                                padding: EdgeInsets.only(top:7),
                                                child: Text('100 \$',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700))),
                                          )),
                                    ],),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top : 10,left: 190),
                                          child: IconButton(icon: Icon(Icons.favorite,color:favoriteIconColor,size: 42,),
                                              onPressed: (){
                                                setState(() {
                                                  favoriteIconColor = Colors.red;
                                                });
                                                }
                                          ),),
                                      ],),
                                  ],),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left:10 ),
                                    child: Container(
                                      height: 24,
                                      alignment: Alignment.centerLeft,
                                      child: Text(documentData['brand'],
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:5,left: 10),
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
                                                      documentData['size'],
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
                                                    alignment: Alignment
                                                        .bottomCenter,
                                                    child: Text(
                                                      documentData['length'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                          Colors.white,
                                                          fontWeight:
                                                          FontWeight
                                                              .w100),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    alignment: Alignment
                                                        .bottomCenter,
                                                    child: Text(
                                                      documentData['width'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                          Colors.white,
                                                          fontWeight:
                                                          FontWeight
                                                              .w100),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top:5),
                                              child: Container(
                                                height: 18,
                                                alignment: Alignment.topLeft,
                                                child: Row( mainAxisAlignment: MainAxisAlignment.start,
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
                                                            color:
                                                            Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w100),
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
                                                            color:
                                                            Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w100),
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
                                    padding:  EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 16,
                                      alignment: Alignment.bottomLeft,
                                        child: Row(children:<Widget> [
                                          Text(" Матеріал : ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff9A9A9A),
                                                  fontWeight: FontWeight.w100)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(documentData['material'],style: TextStyle(fontSize: 10,color: Color(0xff9A9A9A)),),
                                          )
                                        ],)
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:16,left: 10),
                                    child: Container(
                                      child: Text("Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                                          style: TextStyle(fontSize: 12,color: Color(0xffABB4BD))),),
                                  )
                                ],
                              ),
                            ),
                            flex: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child:Container(
                                  height: 100,
                                  color: Color(0xff232326),
                                  child: Row(children: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        height: 61,
                                        child: Image.asset('assets/images/4.png')

                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 13),
                                      child: Column (
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Продавець",style: TextStyle(fontSize: 22,color: Colors.white),),
                                          Padding(
                                            padding:  EdgeInsets.only(right: 30),
                                            child: Text("Ukraine, Vinnytsia",style: TextStyle(fontSize: 10,color: Colors.white),),
                                          ),
                                        ],),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 70),
                                        child :Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children : <Widget>[Container (
                                                alignment: Alignment.centerRight,
                                                child :FloatingActionButton(
                                                  onPressed: (){},
                                                  backgroundColor: Color(0xff007AFF),
                                                  child: Icon(Icons.phone,color: Colors.black,size: 28,),
                                                ))])
                                    ),
                                  ],)
                              )),
                        ],
                      ),
                    ),
                  ))));
  }
}
