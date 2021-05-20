import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopamain/providers/product_model_provider.dart';
import 'package:get/get.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> get products {
    return firebaseFirestore
        .collection("products")
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((DocumentSnapshot documentSnapshot) => Product(
                  id: documentSnapshot.get(['id']),
                  brand: documentSnapshot.get(['brand']),
                  size: documentSnapshot.get(['size']),
                  length: documentSnapshot.get(['length']),
                  width: documentSnapshot.get(['width']),
                  imageUrl: documentSnapshot.get(['imageUrl']),
                  material: documentSnapshot.get(['material']),
                ))
            .toList());
  }

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

  final CollectionReference userFavRef =
      FirebaseFirestore.instance.collection("usersFavorite");
}
