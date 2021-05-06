import 'package:flutter/material.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/MoreInfoScreen.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  Color favoriteIconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final double radius = 22;

    return Scaffold(
      backgroundColor: Colors.black,
        body:
        InkWell( onTap: (){
          Get.to(MoreInfo());},
        child :Stack( children : <Widget>[
        Container(
          height: 150,
          decoration: BoxDecoration(color: Colors.black),
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
                          child: Image.asset('assets/images/Sneaker2.png'),
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
                                                      "40",
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
                                                          "28.5",
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
                                                          "10",
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
                                        Container(
                                          height: 5,
                                        ),
                                        Expanded(
                                            flex: 3,
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
                                                          color: Colors.white,
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
                              child: Text(" Матеріал : шкіра",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100)),
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
          child: IconButton(icon: Icon(Icons.favorite,color:favoriteIconColor),
              onPressed: (){
    setState(() {
    if(favoriteIconColor == Colors.white){
    favoriteIconColor = Colors.red;
    }else{
    favoriteIconColor = Colors.white;
    }
              });}
        ),),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children :<Widget>[
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
              )),]),
        ])),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,

    leading: GestureDetector(
    onTap: () { },
    child: Container(
        alignment: Alignment.bottomLeft,
        child: IconButton(
            icon: Icon(Icons.filter_list_alt,size: 16),
            color: Colors.white,
            onPressed: () {
              filterAddButtonSheet(context);
            })),
        )));
  }
  void filterAddButtonSheet (context){
    showModalBottomSheet(
        context: context, builder: (BuildContext bc){
      return Container (
        color: Color(0xff4E4E53),
        height:  MediaQuery.of(context).size.height*45,
        child: SingleChildScrollView(child :Padding(
          padding: const EdgeInsets.all(8.0),
          child : Column (children: <Widget>[
           Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
             Container(
               alignment: Alignment.center,
               child: IconButton(icon: Icon(Icons.keyboard_arrow_down,size: 27,color: Colors.black,),
                   onPressed:(){
                 Navigator.of(context).pop();
                   }),
             ),
             Row(children: <Widget>[
               Expanded (child:TextField(decoration: InputDecoration(
                     labelText: "Модель",
                 labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                 prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                   style: TextStyle(
                       fontSize: (14), color: Colors.white)
                       ),)],),
                 Row(children: <Widget>[
                   Expanded (child:TextField(decoration: InputDecoration(
                     labelText: "Матеріал",
                     labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                     prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                       style: TextStyle(
                           fontSize: (14), color: Colors.white)
                   ),)],),
                 Row(children: <Widget>[
                   Expanded (child:Row(children: <Widget>[
                     Expanded(child : TextField(decoration: InputDecoration(
                       labelText: "Розмір",
                       labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                       prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                         style: TextStyle(
                             fontSize: (14), color: Colors.white)
                     ),flex:5),
                     Spacer(flex: 1),
                     Expanded(child :TextField(style: TextStyle(
                         fontSize: (14), color: Colors.white)),flex:5),
                     Expanded(child: Container(),flex:9)
                   ],)
                   )],),
                 Row(children: <Widget>[
                   Expanded (child:Row(children: <Widget>[
                     Expanded(child : TextField(decoration: InputDecoration(
                       labelText: "Ціна",
                       labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                       prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),
                     ), style: TextStyle(
                             fontSize: (14), color: Colors.white)
                     ),flex:5),
                     Spacer(flex: 1),
                     Expanded(child :TextField(style: TextStyle(
                         fontSize: (14), color: Colors.white)),flex:5),
                     Expanded(child: Container(),flex:9)
                   ],)
                   )],),
             Row (
               mainAxisAlignment: MainAxisAlignment.end,
               children :<Widget>[
               TextButton(onPressed: (){},
                 child: Text('СКИНУТИ',
                   style: TextStyle(fontSize: 12,color: Colors.blue),)),
                 Container(height: 50,width: 50,),
                 Container (
                     margin: EdgeInsets.only(right: 15),
                     child :TextButton(onPressed: (){},
                     child: Text('ЗАСТОСУВАТИ',style: TextStyle(fontSize: 12,color: Colors.blue),)))
               ],),
          ],),]),
           )),
          );
    });
  }
}
