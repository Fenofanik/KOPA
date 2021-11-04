
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/app_boarders.dart';
import 'package:kopamain/core/constant/text_styles.dart';
import 'package:get/get.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/data_widgets/image_swipe.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';
import 'package:kopamain/presentation/utils/app_bar.dart';
import '../detail_screen_controller.dart';

class DetailScreen extends StatelessWidget {

 final  SneakerModel sneakerModel;
  DetailScreen({this.sneakerModel});

final DetailScreenController dsc = Get.put(DetailScreenController());

final MainScreenController mcs = Get.find();
final UserFavoriteController ufc = Get.find();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child:
          GetBuilder<DetailScreenController>(builder: (controller){
            return  SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(color: ThemeManager.background),
                    height: Get.height,
                    width: Get.width,
                    child: Card(
                      shape: detailBorder,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: ThemeManager.containerColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                                flex: 6,
                                child: ImageSwipe(
                                  imageList: sneakerModel.image,
                                )),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 1, bottom: 8, right: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Container(
                                              decoration: priceContainer,
                                              height: 30,
                                              width: 74,
                                              child: Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 7),
                                                  child: Text(sneakerModel.price,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: detailStyle2)),
                                            )),
                                        Container(
                                          alignment: Alignment.topRight,
                                          margin:  const EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: IconButton(
                                              icon:Icon(Icons.favorite,
                                                  size: 42,
                                                  color:
                                                  controller.currentUser.favorite!=null?
                                                  controller.currentUser.favorite.any(
                                                          (element) => element == sneakerModel.id.trim())
                                                      ? ThemeManager
                                                      .redThings
                                                      : ThemeManager
                                                      .whiteThings
                                                      :ThemeManager
                                                      .whiteThings
                                              ),
                                              onPressed: () async {

                                               controller.updateUserFavorites(sneakerModel);
                                               mcs.onInit();
                                               ufc.onInit();
                                              }),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, left: 10),
                                      child: Container(
                                        height: 24,
                                        alignment: Alignment.centerLeft,
                                        child: Text(sneakerModel.brand,
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
                                            style: detailStyle),
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
                                                        sneakerModel.size,
                                                        style: detailScreen3,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Text(
                                                        sneakerModel.length,
                                                        style: detailStyle2,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      alignment:
                                                      Alignment.bottomCenter,
                                                      child: Text(
                                                        sneakerModel.width,
                                                        style: detailStyle2,
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
                                                          style: detailStyle,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        alignment:
                                                        Alignment.topCenter,
                                                        child: Text(
                                                          "Довжина/см",
                                                          style: detailStyle,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        alignment:
                                                        Alignment.topCenter,
                                                        child: Text(
                                                          "Ширина/см",
                                                          style: detailStyle,
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
                                                  style: detailStyle),
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  sneakerModel.material,
                                                  style: detailStyle,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 16, left: 10),
                                      child: Container(
                                        child:
                                        sneakerModel.userAddAbout==""?
                                        Text(
                                            "Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                                            style: detailStyle):
                                        Text(sneakerModel.userAddAbout,style: detailStyle),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              flex: 5,
                            ),
                            // Expanded(
                            //     flex: 1,
                            //     child:
                            //     authorId==userId?
                            //     Container(
                            //       color: ThemeManager.background,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(left: 45,right: 45,top: 10,bottom: 10),
                            //         child: Container(
                            //           child: document['sold'] ? ElevatedButton(
                            //             onPressed: (){
                            //               _showDelete(document);
                            //             },
                            //             style: ElevatedButton.styleFrom(
                            //               shape:  shape,
                            //               primary: ThemeManager.forButtons,
                            //             ),
                            //             child: Text("Видалити з архіву",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
                            //           ): ElevatedButton(
                            //             onPressed: (){
                            //               _showMyDialog(document);
                            //             },
                            //             style: ElevatedButton.styleFrom(
                            //               shape:  shape,
                            //               primary: ThemeManager.forButtons,
                            //             ),
                            //             child: Text("Видалити оголошення",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
                            //           ),
                            //         ),
                            //       ),
                            //     ):
                            //     Container(
                            //         color: ThemeManager.background,
                            //         child: Row(
                            //           children: <Widget>[
                            //             Container(
                            //                 alignment: Alignment.centerLeft,
                            //                 height: 61,
                            //                 child:
                            //                 Image.asset('assets/images/4.png')),
                            //             Padding(
                            //               padding: EdgeInsets.only(left: 13),
                            //               child: Column(
                            //                 mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //                 children: <Widget>[
                            //                   Text(
                            //                     "Продавець",
                            //                     style: TextStyle(
                            //                         fontSize: 22,
                            //                         color:
                            //                         ThemeManager.whiteThings),
                            //                   ),
                            //                   Padding(
                            //                     padding: EdgeInsets.only(right: 30),
                            //                     child: Text(
                            //                       "Ukraine, Vinnytsia",
                            //                       style: TextStyle(
                            //                           fontSize: 10,
                            //                           color:
                            //                           ThemeManager.whiteThings),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Padding(
                            //                 padding: EdgeInsets.only(left: 70),
                            //                 child: Row(
                            //                     mainAxisAlignment:
                            //                     MainAxisAlignment.end,
                            //                     children: <Widget>[
                            //                       Container(
                            //                           alignment:
                            //                           Alignment.centerRight,
                            //                           child: FloatingActionButton(
                            //                             onPressed: () {
                            //                               _showSellerPhone();
                            //                             },
                            //                             backgroundColor:
                            //                             ThemeManager
                            //                                 .phoneButtonSell,
                            //                             child: Icon(
                            //                               Icons.phone,
                            //                               color: ThemeManager
                            //                                   .blackThings,
                            //                               size: 28,
                            //                             ),
                            //                           ))
                            //                     ])),
                            //           ],
                            //         ))),
                          ],
                        ),
                      ),
                    )));
          })
        ),
        appBar: getAppBar(context),
        backgroundColor: ThemeManager.background,
      );
  }

  // @override
  // Widget buildFloatingButton(BuildContext context) {
  //   return null;
  // }
  //
  // @override
  // Widget buildFooter(BuildContext context) {
  //   return null;
  // }
  //
  // @override
  // Widget buildHeader(BuildContext context) {
  //   return getAppBar(context);
  // }


 // Widget moreInfoUI(BuildContext context, DocumentSnapshot document,
 //     List<String> favs, String userId) {
 //   List imageList = document['image'];
 //
 //   String authorId = document["author"];
 //   String addAbout = document["userAddAbout"];
 //
 //   final double radius = 22;
 //   final shape =  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
 //   return SingleChildScrollView(
 //       child: Container(
 //           decoration: BoxDecoration(color: ThemeManager.background),
 //           height: MediaQuery.of(context).size.height,
 //           width: MediaQuery.of(context).size.width,
 //           child: Padding(
 //               padding: EdgeInsets.all(1),
 //               child: Card(
 //                 shape: RoundedRectangleBorder(
 //                   borderRadius: BorderRadius.circular(radius),
 //                 ),
 //                 clipBehavior: Clip.antiAlias,
 //                 child: Container(
 //                   color: ThemeManager.containerColor,
 //                   child: Column(
 //                     crossAxisAlignment: CrossAxisAlignment.stretch,
 //                     mainAxisSize: MainAxisSize.max,
 //                     children: <Widget>[
 //                       Expanded(
 //                           flex: 5,
 //                           child: ImageSwipe(
 //                             imageList: imageList,
 //                           )),
 //                       Expanded(
 //                         child: Container(
 //                           margin: EdgeInsets.only(
 //                               top: 10, left: 1, bottom: 8, right: 0),
 //                           child: Column(
 //                             crossAxisAlignment: CrossAxisAlignment.stretch,
 //                             children: <Widget>[
 //                               Row(
 //                                 children: <Widget>[
 //                                   Row(
 //                                     children: <Widget>[
 //                                       Padding(
 //                                           padding: EdgeInsets.only(
 //                                               top: 10, left: 10),
 //                                           child: Container(
 //                                             decoration: BoxDecoration(
 //                                                 borderRadius:
 //                                                 BorderRadius.circular(22),
 //                                                 color: ThemeManager
 //                                                     .boxPriceColor),
 //                                             height: 30,
 //                                             width: 74,
 //                                             child: Padding(
 //                                                 padding:
 //                                                 EdgeInsets.only(top: 7),
 //                                                 child: Text(document['price'],
 //                                                     textAlign:
 //                                                     TextAlign.center,
 //                                                     style: TextStyle(
 //                                                         fontSize: 16,
 //                                                         color: ThemeManager
 //                                                             .textPrice,
 //                                                         fontWeight: FontWeight
 //                                                             .w700))),
 //                                           )),
 //                                     ],
 //                                   ),
 //                                   Row(
 //                                     mainAxisAlignment: MainAxisAlignment.end,
 //                                     children: <Widget>[
 //                                       Padding(
 //                                         padding: const EdgeInsets.only(
 //                                             top: 10, left: 190),
 //                                         child: authorId == userId?IconButton(
 //                                             icon: Icon(
 //                                               Icons.create_outlined,
 //                                               size: 42,
 //                                               color: ThemeManager
 //                                                   .whiteThings,
 //                                             ),
 //                                             onPressed: () {
 //                                               Navigator.push(
 //                                                   context,
 //                                                   MaterialPageRoute(
 //                                                       builder: (context) => UserCreate(product: ProductModel(
 //                                                         author: document["author"].toString(),
 //                                                         brand:document["brand"].toString(),
 //                                                         id:document["id"].toString(),
 //                                                         image: List<String>.from(imageList),
 //                                                         length:document["length"].toString(),
 //                                                         material:document["material"].toString(),
 //                                                         price:document["price"].toString(),
 //                                                         size:document["size"].toString(),
 //                                                         sold:document["sold"],
 //                                                         width:document["width"].toString(),
 //                                                         userAddAbout:document["userAddAbout"].toString(),
 //                                                       ))));
 //                                             }):IconButton(
 //                                             icon:Icon(Icons.favorite,
 //                                                 size: 42,
 //                                                 color: favs.contains(
 //                                                     document.id)
 //                                                     ? ThemeManager
 //                                                     .redThings
 //                                                     : ThemeManager
 //                                                     .whiteThings),
 //                                             onPressed: () async {
 //                                               await firebaseServices
 //                                                   .updateUserFavs(
 //                                                   document.id, favs);
 //                                             }),),
 //
 //                                     ],
 //                                   ),
 //                                 ],
 //                               ),
 //                               Padding(
 //                                 padding: EdgeInsets.only(top: 5, left: 10),
 //                                 child: Container(
 //                                   height: 24,
 //                                   alignment: Alignment.centerLeft,
 //                                   child: Text(document['brand'],
 //                                       style: TextStyle(
 //                                           fontSize: 22,
 //                                           color: ThemeManager.whiteThings,
 //                                           fontWeight: FontWeight.w300)),
 //                                 ),
 //                               ),
 //                               Padding(
 //                                 padding: EdgeInsets.only(top: 5, left: 10),
 //                                 child: Container(
 //                                   alignment: Alignment.bottomLeft,
 //                                   child: Text(" Розміри стопи: ",
 //                                       style: TextStyle(
 //                                           fontSize: 10,
 //                                           color: ThemeManager.whiteThings,
 //                                           fontWeight: FontWeight.w100)),
 //                                 ),
 //                               ),
 //                               Container(
 //                                 child: Padding(
 //                                   padding: EdgeInsets.only(
 //                                       top: 5, left: 5, bottom: 2, right: 6),
 //                                   child: Container(
 //                                     child: Column(
 //                                       children: <Widget>[
 //                                         Container(
 //                                           alignment: Alignment.bottomLeft,
 //                                           child: Row(
 //                                             children: <Widget>[
 //                                               Container(
 //                                                 width: 40,
 //                                                 alignment:
 //                                                 Alignment.bottomCenter,
 //                                                 child: Text(
 //                                                   document['size'],
 //                                                   style: TextStyle(
 //                                                       fontSize: 22,
 //                                                       color: ThemeManager
 //                                                           .textSize,
 //                                                       fontWeight:
 //                                                       FontWeight.w100),
 //                                                 ),
 //                                               ),
 //                                               Container(
 //                                                 width: 100,
 //                                                 alignment:
 //                                                 Alignment.bottomCenter,
 //                                                 child: Text(
 //                                                   document['length'],
 //                                                   style: TextStyle(
 //                                                       fontSize: 14,
 //                                                       color: ThemeManager
 //                                                           .whiteThings,
 //                                                       fontWeight:
 //                                                       FontWeight.w100),
 //                                                 ),
 //                                               ),
 //                                               Container(
 //                                                 width: 100,
 //                                                 alignment:
 //                                                 Alignment.bottomCenter,
 //                                                 child: Text(
 //                                                   document['width'],
 //                                                   style: TextStyle(
 //                                                       fontSize: 14,
 //                                                       color: ThemeManager
 //                                                           .whiteThings,
 //                                                       fontWeight:
 //                                                       FontWeight.w100),
 //                                                 ),
 //                                               ),
 //                                             ],
 //                                           ),
 //                                         ),
 //                                         Padding(
 //                                           padding: EdgeInsets.only(top: 5),
 //                                           child: Container(
 //                                             height: 18,
 //                                             alignment: Alignment.topLeft,
 //                                             child: Row(
 //                                               mainAxisAlignment:
 //                                               MainAxisAlignment.start,
 //                                               children: <Widget>[
 //                                                 Container(
 //                                                   width: 40,
 //                                                   alignment:
 //                                                   Alignment.topCenter,
 //                                                   child: Text(
 //                                                     "EU",
 //                                                     style: TextStyle(
 //                                                         fontSize: 10,
 //                                                         color: ThemeManager
 //                                                             .whiteThings,
 //                                                         fontWeight:
 //                                                         FontWeight.w100),
 //                                                   ),
 //                                                 ),
 //                                                 Container(
 //                                                   width: 100,
 //                                                   alignment:
 //                                                   Alignment.topCenter,
 //                                                   child: Text(
 //                                                     "Довжина/см",
 //                                                     style: TextStyle(
 //                                                         fontSize: 10,
 //                                                         color: ThemeManager
 //                                                             .whiteThings,
 //                                                         fontWeight:
 //                                                         FontWeight.w100),
 //                                                   ),
 //                                                 ),
 //                                                 Container(
 //                                                   width: 100,
 //                                                   alignment:
 //                                                   Alignment.topCenter,
 //                                                   child: Text(
 //                                                     "Ширина/см",
 //                                                     style: TextStyle(
 //                                                         fontSize: 10,
 //                                                         color: ThemeManager
 //                                                             .whiteThings,
 //                                                         fontWeight:
 //                                                         FontWeight.w100),
 //                                                   ),
 //                                                 ),
 //                                               ],
 //                                             ),
 //                                           ),
 //                                         ),
 //                                       ],
 //                                     ),
 //                                   ),
 //                                 ),
 //                               ),
 //                               Padding(
 //                                 padding: EdgeInsets.only(left: 10),
 //                                 child: Container(
 //
 //                                     alignment: Alignment.bottomLeft,
 //                                     child: Row(
 //                                       children: <Widget>[
 //                                         Text(" Матеріал : ",
 //                                             style: TextStyle(
 //                                                 fontSize: 10,
 //                                                 color:
 //                                                 ThemeManager.textMaterial,
 //                                                 fontWeight: FontWeight.w100)),
 //                                         Padding(
 //                                           padding: EdgeInsets.only(left: 5),
 //                                           child: Text(
 //                                             document['material'],
 //                                             style: TextStyle(
 //                                                 fontSize: 10,
 //                                                 color: ThemeManager
 //                                                     .textMaterial),
 //                                           ),
 //                                         )
 //                                       ],
 //                                     )),
 //                               ),
 //                               Padding(
 //                                 padding: EdgeInsets.only(top: 16, left: 10),
 //                                 child: Container(
 //                                   child:
 //                                   addAbout==""?
 //                                   Text(
 //                                       "Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
 //                                       style: TextStyle(
 //                                           fontSize: 12,
 //                                           color: ThemeManager.forTextAbout)):
 //                                   Text(document["userAddAbout"],style: TextStyle(
 //                                       fontSize: 12,
 //                                       color: ThemeManager.forTextAbout)),
 //                                 ),
 //                               )
 //                             ],
 //                           ),
 //                         ),
 //                         flex: 5,
 //                       ),
 //                       Expanded(
 //                           flex: 1,
 //                           child:
 //                           authorId==userId?
 //                           Container(
 //                             color: ThemeManager.background,
 //                             child: Padding(
 //                               padding: const EdgeInsets.only(left: 45,right: 45,top: 10,bottom: 10),
 //                               child: Container(
 //                                 child: document['sold'] ? ElevatedButton(
 //                                   onPressed: (){
 //                                     _showDelete(document);
 //                                   },
 //                                   style: ElevatedButton.styleFrom(
 //                                     shape:  shape,
 //                                     primary: ThemeManager.forButtons,
 //                                   ),
 //                                   child: Text("Видалити з архіву",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
 //                                 ): ElevatedButton(
 //                                   onPressed: (){
 //                                     _showMyDialog(document);
 //                                   },
 //                                   style: ElevatedButton.styleFrom(
 //                                     shape:  shape,
 //                                     primary: ThemeManager.forButtons,
 //                                   ),
 //                                   child: Text("Видалити оголошення",style: TextStyle(fontSize: 16,color: ThemeManager.whiteThings),),
 //                                 ),
 //                               ),
 //                             ),
 //                           ):
 //                           Container(
 //                               color: ThemeManager.background,
 //                               child: Row(
 //                                 children: <Widget>[
 //                                   Container(
 //                                       alignment: Alignment.centerLeft,
 //                                       height: 61,
 //                                       child:
 //                                       Image.asset('assets/images/4.png')),
 //                                   Padding(
 //                                     padding: EdgeInsets.only(left: 13),
 //                                     child: Column(
 //                                       mainAxisAlignment:
 //                                       MainAxisAlignment.center,
 //                                       children: <Widget>[
 //                                         Text(
 //                                           "Продавець",
 //                                           style: TextStyle(
 //                                               fontSize: 22,
 //                                               color:
 //                                               ThemeManager.whiteThings),
 //                                         ),
 //                                         Padding(
 //                                           padding: EdgeInsets.only(right: 30),
 //                                           child: Text(
 //                                             "Ukraine, Vinnytsia",
 //                                             style: TextStyle(
 //                                                 fontSize: 10,
 //                                                 color:
 //                                                 ThemeManager.whiteThings),
 //                                           ),
 //                                         ),
 //                                       ],
 //                                     ),
 //                                   ),
 //                                   Padding(
 //                                       padding: EdgeInsets.only(left: 70),
 //                                       child: Row(
 //                                           mainAxisAlignment:
 //                                           MainAxisAlignment.end,
 //                                           children: <Widget>[
 //                                             Container(
 //                                                 alignment:
 //                                                 Alignment.centerRight,
 //                                                 child: FloatingActionButton(
 //                                                   onPressed: () {
 //                                                     _showSellerPhone();
 //                                                   },
 //                                                   backgroundColor:
 //                                                   ThemeManager
 //                                                       .phoneButtonSell,
 //                                                   child: Icon(
 //                                                     Icons.phone,
 //                                                     color: ThemeManager
 //                                                         .blackThings,
 //                                                     size: 28,
 //                                                   ),
 //                                                 ))
 //                                           ])),
 //                                 ],
 //                               ))),
 //                     ],
 //                   ),
 //                 ),
 //               ))));
 // }
}
