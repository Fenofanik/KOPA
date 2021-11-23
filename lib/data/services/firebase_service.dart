import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference productRef =
      FirebaseFirestore.instance.collection("products");
}
