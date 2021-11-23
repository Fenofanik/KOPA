import 'package:kopamain/data/services/firebase_service.dart';
import 'package:kopamain/domain/models/user_model.dart';

class UserService {
  Future<UserModel> getUserById() async {
    try {
      final userId = FirebaseServices().firebaseAuth.currentUser.uid;
      var response =
          await FirebaseServices().userRef.where("id", isEqualTo: userId).get();
      var user = UserModel.fromMap(response.docs[0].data());
      return user;
    } catch (e) {
      print(e);
      return UserModel();
    }
  }

  Future<UserModel> updateUserFavorite(UserModel user) async {
    try {
      await FirebaseServices()
          .userRef
          .doc(user.id)
          .update({'favs': user.favorite});
      return user;
    } catch (e) {
      print(e);
      return UserModel();
    }
  }

  Future<UserModel> updateUserImage(UserModel user) async {
    try {
      await FirebaseServices()
          .userRef
          .doc(user.id)
          .update({'imageUrl': user.image});
      return user;
    } catch (e) {
      print(e);
      return UserModel();
    }
  }

  Future<UserModel> updateUserInfo(UserModel user) async {
    try {
      await FirebaseServices().userRef.doc(user.id).update({
        "name": user.firstName,
        "secondName": user.secondName,
        "city": user.city
      });
      return user;
    } catch (e) {
      print(e);
      return UserModel();
    }
  }
}
