import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MoreInfo extends StatefulWidget {
  @override
  MoreInfoState createState() => MoreInfoState();
}

class MoreInfoState extends State<MoreInfo> {
  Color favoriteIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final double radius = 22;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children : <Widget>[
        SingleChildScrollView(child :Container (
            decoration: BoxDecoration(color: Colors.black),
            height: 1000,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(radius),
                            child: FittedBox(
                              child: Image.asset('assets/images/Sneaker3.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
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
                                        padding: EdgeInsets.only(top:15),
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
                                  Container(width: 160,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(icon: Icon(Icons.favorite,color:favoriteIconColor,size: 42,),
                                            onPressed: (){
                                              setState(() {
                                                if(favoriteIconColor == Colors.white){
                                                  favoriteIconColor = Colors.red;
                                                }else{
                                                  favoriteIconColor = Colors.white;
                                                }
                                              });}
                                        ),),
                                    ],),
                                ],),
                                Container(
                                  height: 24,
                                  //color: Colors.blue,
                                  alignment: Alignment.centerLeft,
                                  child: Text("Nike 992K",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300)),
                                ),
                                Container(
                                  height: 16,
                                  //color: Colors.green,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(" Розміри стопи: ",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100)),
                                ),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 7, left: 1, bottom: 2, right: 6),
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
                                                    "40",
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
                                                    "28.5",
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
                                                    "10",
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
                                          Container(
                                            height: 5,
                                          ),
                                          Container(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 16,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(" Матеріал : Шкіра / Поліестер",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff9A9A9A),
                                          fontWeight: FontWeight.w100)),
                                ),
                                Container(
                                  child: Text("Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                                      style: TextStyle(fontSize: 12,color: Color(0xff9A9A9A))),)
                              ],
                            ),
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child:Container(
                                height: 100,
                                color: Colors.black,
                                child: Row(children: <Widget>[
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      height: 61,
                                      child: Image.asset('assets/images/4.png')

                                  ),
                                  Container(width: 20,),

                                  Column (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Продавець",style: TextStyle(fontSize: 22,color: Colors.white),),
                                      Text("Ukraine, Vinnytsia",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ],),
                                  Container(width: 20,),

                                  Padding(padding: EdgeInsets.only(left: 20),
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
                )))),
      ]),
      appBar: AppBar(
        backgroundColor: Colors.black,
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
}
