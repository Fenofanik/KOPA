import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  String getUserPhone() {
    return firebaseAuth.currentUser.phoneNumber;
  }

  String getUserId() {
    return firebaseAuth.currentUser.uid;
  }

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference productRef =
      FirebaseFirestore.instance.collection("products");

    getUser() async{
    final userId = firebaseAuth.currentUser.uid;
      userRef.doc(userId);
  }

  getUserFavs() async {
    final user = await getUser().get();
    return List<String>.from(user['favs']);
  }

  updateUserFavs(String productId, List<String> existingFavs) async {
    final existingFavs = await getUserFavs();
    List<String> newFavs = [];
    if (existingFavs.contains(productId)) {
      newFavs = existingFavs.where((x) => x != productId).toList();
    } else {
      newFavs = [...existingFavs, ...[productId]];
    }
    await userRef.doc(getUserId()).update({'favs': newFavs});
  }
}
