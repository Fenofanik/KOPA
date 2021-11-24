
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/data/services/user_service.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/domain/models/user_model.dart';

class SneakersService {
  CollectionReference ref;

  Future<List<SneakerModel>> getSneakerList() async {
    QuerySnapshot data = await FirebaseServices().productRef.get();
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
    });
    return sneaker;
  }

  Future<List<SneakerModel>> getUserProducts() async {
    User user = FirebaseAuth.instance.currentUser;
    QuerySnapshot data = await FirebaseServices()
        .productRef
        .where('author', isEqualTo: user.uid).where('sold', isEqualTo: false)
        .get();
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
    });
    return sneaker;
  }

  Future<List<SneakerModel>> getUserArchive() async {
    QuerySnapshot data = await FirebaseServices()
        .productRef
        .where('sold', isEqualTo: true)
        .get();
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
    });
    return sneaker;
  }

  Future<List<SneakerModel>> getFavorites() async {
    UserModel user;
    await UserService().getUserById().then((value) => user = value);
    QuerySnapshot data = await FirebaseServices()
        .productRef
        .where('id'.trim(), whereIn: user.favorite)
        .get();
    List<SneakerModel> sneaker = [];
    data.docs.forEach((e) {
      sneaker.add(SneakerModel.fromMap(e.data()));
    });
    return sneaker;
  }

  Future<SneakerModel> createProduct (SneakerModel sneaker)async{

    return sneaker;
  }

  Future<SneakerModel> updateProduct(SneakerModel sneaker) async {
    final data = {
      "author": sneaker?.author,
      "sold": sneaker?.sold,
      "image": sneaker?.image,
      "size": sneaker?.size,
      "length": sneaker?.length,
      "width": sneaker?.width,
      "brand": sneaker?.brand,
      "material": sneaker?.material,
      "userAddAbout": sneaker?.userAddAbout,
      "price": sneaker?.price,
    };
    try{
      await FirebaseServices().productRef.doc(sneaker.id).update(data);
    }
    catch(e){
      print(e);
    }
    return sneaker;
  }

  Future<SneakerModel> moveProductToArchive(SneakerModel sneaker) async {
    final data = {
      "author": sneaker?.author,
      "sold": sneaker?.sold,
      "image": sneaker?.image,
      "size": sneaker?.size,
      "length": sneaker?.length,
      "width": sneaker?.width,
      "brand": sneaker?.brand,
      "material": sneaker?.material,
      "userAddAbout": sneaker?.userAddAbout,
      "price": sneaker?.price,
    };
    try{
      await FirebaseServices().productRef.doc(sneaker.id).update(data);
    }
    catch(e){
      print(e);
    }
    return sneaker;
  }


  Future <void> deleteProduct(SneakerModel deleteSneaker)async{
     await FirebaseServices().productRef.doc(deleteSneaker.id).delete();
  }
}
