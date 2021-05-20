import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreenMain extends StatefulWidget {
  @override
  ProfileScreenMainState createState() => ProfileScreenMainState();
}

class ProfileScreenMainState extends State<ProfileScreenMain> {
  FirebaseServices firebaseServices = FirebaseServices();

  User user;
  FirebaseAuth _auth;

  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    user = _auth.currentUser;
  }

  PickedFile _imageFile;
  String imageUrl;
  final ImagePicker _picker = ImagePicker();

  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  @override
  Widget build(BuildContext context) {
    return //signOutButton();
        Scaffold(
      backgroundColor: ThemeManager.background,
      body: FutureBuilder<QuerySnapshot>(
        future: firebaseServices.userRef.get(),
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
            return ListView(
              children: snapshot.data.docs.map((document) {
                return SingleChildScrollView(
                    child: Column(children: <Widget>[
                  imageNameAndIcon(document),
                  SizedBox(
                    height: 20,
                  ),
                  phoneText(document),
                  SizedBox(
                    height: 20,
                  ),
                  cityText(document),
                  SizedBox(
                    height: 50,
                  ),
                  signOutButton()
                ]));
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
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        automaticallyImplyLeading: false,
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
            await _storage.ref().child('folderName/imageName').putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

          setState(() {
            imageUrl = downloadUrl;
            String _userId = firebaseServices.getUserId();
            FirebaseFirestore.instance.collection('users').doc(_userId).update({
              "imageUrl": imageUrl,
            });
          });

      } else {
        print('No path received');
      }
    } else {
      print('Wooops');
    }
  }

  Widget imageNameAndIcon(document) {
    return Center(
        child: Row(children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
              imageUrl==null?
              AssetImage("assets/images/2.png"):
                NetworkImage(document.data()['imageUrl']),
              radius: 70,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 2,
              child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff0CCDE6)),
                  child: IconButton(
                    iconSize: 25.0,
                    onPressed: () {
                      uploadImage();
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ))),
        ],
      ),
      SizedBox(
        width: 10,
      ),
      Row(
        children: [
          Text(
            document['name'],
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            document['secondName'],
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    ]));
  }

  Widget phoneText(document) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Контактний номер",
              style: TextStyle(fontSize: 14, color: Colors.white)),
          SizedBox(height: 5),
          Container(
            width: 320,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xffABB4BD), width: 1))),
            child: Text(
              document['phoneNumber'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ]));
  }

  Widget cityText(document) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Місто", style: TextStyle(fontSize: 14, color: Colors.white)),
          SizedBox(height: 5),
          Container(
            width: 320,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xffABB4BD), width: 1))),
            child: Text(
              document['city'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ]));
  }

  Widget signOutButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: shape,
                minimumSize: Size(290, 40),
                padding: EdgeInsets.only(left: 35, right: 35),
                primary: Colors.lightBlueAccent,
              ),
              child: Text("Вийти",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushNamed(context, '/LoginPage');
              })),
    );
  }
}
