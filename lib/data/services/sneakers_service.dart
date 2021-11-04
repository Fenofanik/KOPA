

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';

class SneakersService{
  CollectionReference ref;

  Future <List<SneakerModel>> getSneakerList() async{

    QuerySnapshot data = await FirebaseServices().productRef.get();
    List<SneakerModel> sneaker = [];
      data.docs.forEach((e) {
        sneaker.add(SneakerModel.fromMap(e.data()));
      });
    return sneaker;
  }

  Future <List<SneakerModel>> getUserProducts() async{
    UserModel user;
   await  UserService().getUserById().then((value) => user = value);
    QuerySnapshot data = await
    FirebaseServices().productRef.where('author', isEqualTo: user.id).get();
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
      print("A OT I KROSOVOKI : ${sneaker.map((e) => e.id).toList()}" + 'A OT I IH AVTOR${sneaker.map((e) => e.author)}');
      print("A OT I AUTHOR : ${sneaker.map((e) => e.author)}");
    });
    return sneaker;
  }


  Future <List<SneakerModel>> getFavorites() async{
    UserModel user;
    await  UserService().getUserById().then((value) => user = value);
    QuerySnapshot data = await
    FirebaseServices().productRef.where('id'.trim(),whereIn: user.favorite).get();
    //whereIn
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
      print("KROSOVOKI LYBIMIE : ${sneaker.map((e) => e.id).toList()}");
      print("USERA LYBIMIE : ${user.favorite.map((e) => e).toList()}");
    });
    return sneaker;
  }


  // Future<SneakerModel> addSneakerToFavorite(SneakerModel sneaker) async{
  //   final data = SneakerModel();
  //   if(data!=null){
  //     data.favorite = sneaker.favorite;
  //   }
  //   await FirebaseServices().productRef.doc(sneaker.id).update(data.favorite);
  //   return data;
  // }
}