import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/MainScreenPages/MoreInfo/MoreInfoScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class UserCreate extends StatefulWidget {
  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {

  FirebaseServices firebaseServices = FirebaseServices();
  TextEditingController theSize = TextEditingController();
  TextEditingController sizeLength = TextEditingController();
  TextEditingController sizeWidth = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController material = TextEditingController();
  TextEditingController aboutSneaker = TextEditingController();
  TextEditingController price = TextEditingController();

  final double radius = 7;
  PickedFile _imageFile;
  String imageUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: userCreateUI(context),
      ),
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        actions: [
          TextButton(
              onPressed: () async {
                final id = await addToCollection();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoreInfo(productId: id)));
              },
              child: Text(
                "Зберегти",
                style: TextStyle(fontSize: 10, color: ThemeManager.forButtons),
              ))
        ],
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

  Widget userCreateUI(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: ThemeManager.containerColor,
                child: Padding(
                  padding: const EdgeInsets.only(top:10,bottom: 5,left: 5,right: 5),
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.forButtons,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: ThemeManager.whiteThings,
                            size: 30,
                          ),
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                      InkWell(onTap:() {
                        uploadImage();
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          color: ThemeManager.whiteThings,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  color: ThemeManager.background,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: ThemeManager.background,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.circle,
                                        size: 9,
                                        color: ThemeManager.forButtons,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Розмір",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ThemeManager.whiteThings),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: ThemeManager.containerColor,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: Image.asset(
                                                "assets/images/Kek.png")),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,bottom:15,right:13 ,left: 10),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                          bottom: BorderSide(
                                                            width: 1,
                                                            color: ThemeManager.myAddBorder,
                                                          ),
                                                        )),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                    right:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: ThemeManager.myAddBorder,
                                                                    ),
                                                                  )),
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 1,),
                                                                        child: Text(
                                                                          "Розмір",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  16,
                                                                              color: ThemeManager.whiteThings),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 25),
                                                                        child: Text(
                                                                          "EU",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              16,
                                                                              color: ThemeManager.whiteThings),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                child:
                                                                    TextFormField(
                                                                      keyboardType: TextInputType.phone,
                                                                      controller: theSize,
                                                                        validator: (String value) {
                                                                          if (value.isEmpty) {
                                                                            return "Поле не повинне бути порожнім";
                                                                          }
                                                                          return null;
                                                                        },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                    const EdgeInsets.only(
                                                                            bottom: 13,left: 5),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        "...",
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        color: ThemeManager.whiteThings),
                                                                  ),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      16,
                                                                      color: ThemeManager.whiteThings),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,bottom:15,right:13 ,left: 10),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                          bottom: BorderSide(
                                                            width: 1,
                                                            color: ThemeManager.myAddBorder,
                                                          ),
                                                        )),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                    right:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: ThemeManager.myAddBorder,
                                                                    ),
                                                                  )),
                                                                  child: Text(
                                                                    "Довжина/см",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        color: ThemeManager.whiteThings),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                child:
                                                                    TextFormField(
                                                                      keyboardType: TextInputType.phone,
                                                                      controller: sizeLength,
                                                                      validator: (String value) {
                                                                        if (value.isEmpty) {
                                                                          return "Поле не повинне бути порожнім";
                                                                        }
                                                                        return null;
                                                                      },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                    const EdgeInsets.only(
                                                                        bottom: 13, left: 5),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        "...",
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        color: ThemeManager.whiteThings),
                                                                  ),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      16,
                                                                      color: ThemeManager.whiteThings),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,bottom:15,right:13 ,left: 10),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                          bottom: BorderSide(
                                                            width: 1,
                                                            color: ThemeManager.myAddBorder,
                                                          ),
                                                        )),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                    right:
                                                                        BorderSide(
                                                                      width: 1,
                                                                      color: ThemeManager.myAddBorder,
                                                                    ),
                                                                  )),
                                                                  child: Text(
                                                                    "Ширина/см",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        color: ThemeManager.whiteThings),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                child:
                                                                    TextFormField(
                                                                      keyboardType: TextInputType.phone,
                                                                      controller: sizeWidth,
                                                                      validator: (String value) {
                                                                        if (value.isEmpty) {
                                                                          return "Поле не повинне бути порожнім";
                                                                        }
                                                                        return null;
                                                                      },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                    const EdgeInsets.only(
                                                                        bottom: 13, left: 5),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        "...",
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        color: ThemeManager.whiteThings),
                                                                  ),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      16,
                                                                      color: ThemeManager.whiteThings),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: Container(
              color: ThemeManager.background,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        controller: model,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Поле не повинне бути порожнім";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Модель",
                          labelStyle:
                              TextStyle(fontSize: 14, color: ThemeManager.whiteThings),
                          prefixIcon: Icon(
                            Icons.circle,
                            size: 9,
                            color: ThemeManager.forButtons,
                          ),
                        ),
                        style: TextStyle(fontSize: (18), color: ThemeManager.whiteThings)),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: ThemeManager.background,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        controller: material,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Поле не повинне бути порожнім";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Матеріал",
                          labelStyle:
                              TextStyle(fontSize: 14, color: ThemeManager.whiteThings),
                          prefixIcon: Icon(
                            Icons.circle,
                            size: 9,
                            color: ThemeManager.forButtons,
                          ),
                        ),
                        style: TextStyle(fontSize: (18), color: ThemeManager.whiteThings)),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: ThemeManager.background,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        controller: aboutSneaker,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Поле не повинне бути порожнім";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Опис",
                          labelStyle:
                              TextStyle(fontSize: 14, color: ThemeManager.whiteThings),
                          prefixIcon: Icon(
                            Icons.circle,
                            size: 9,
                            color: ThemeManager.forButtons,
                          ),
                        ),
                        style: TextStyle(fontSize: (18), color: ThemeManager.whiteThings)),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: ThemeManager.containerColor,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: price,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Поле не повинне бути порожнім";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Ціна",
                          labelStyle:
                              TextStyle(fontSize: 14, color: ThemeManager.whiteThings),
                          prefixIcon: Icon(
                            Icons.circle,
                            size: 9,
                            color: ThemeManager.forButtons,
                          ),
                        ),
                        style: TextStyle(fontSize: (18), color: ThemeManager.whiteThings)),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      _imageFile = await _picker.getImage(source: ImageSource.gallery);
      var file = File(_imageFile.path);

      if (_imageFile != null) {
        var snapshot =
        await _storage.ref().child('UserAdd/filename').putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;

        });

      } else {
        print('No path received');
      }
    } else {
      print('Wooops');
    }
  }

  addToCollection() async  {
    FirebaseServices firebaseServices = FirebaseServices();
    String _userId = firebaseServices.getUserId();
    String userAddSize = theSize.text;
    String userAddSizeLength = sizeLength.text;
    String userAddSizeWidth = sizeWidth.text;
    String userAddModel = model.text;
    String userAddMaterial = material.text;
    String userAddAbout = aboutSneaker.text;
    String userAddPrice = price.text;
    List<String> userAddImg = [imageUrl];
    final obj = await firebaseServices.productRef.add({
      "author": _userId,
      "sold": false,
      "image": userAddImg,
      "size": userAddSize,
      "length": userAddSizeLength,
      "width": userAddSizeWidth,
      "brand": userAddModel,
      "material": userAddMaterial,
      "userAddAbout": userAddAbout,
      "price": "$userAddPrice \$",
      "isFav": false
    });

    await firebaseServices.productRef.doc(obj.id).update({"id": obj.id});
    return obj.id;
  }
}
