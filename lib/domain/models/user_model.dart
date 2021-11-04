import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const EMAIL = "email";
  static const PASSWORD = 'password';
  static const FirstName = 'first_name';
  static const LastName = 'last_name';
  static const Image = 'image';

  String id;
  String firstName;
  String secondName;
  String email;
  String password;
  String image;
  String phone;
  String city;
  List<String> favorite;

  UserModel(
      {this.id,
      this.password,
      this.email,
      this.firstName,
      this.secondName,
      this.phone,
      this.image,
      this.city,
      this.favorite});

  UserModel.fromMap(Map<String, dynamic> snapshot) {
    firstName = snapshot["name"] ?? '';
    secondName = snapshot['secondName'] ?? '';
    phone = snapshot["phoneNumber"] ?? '';
    city = snapshot["city"] ?? '';
    if (snapshot['favs'] != null) {
      favorite = List<String>();
      snapshot['favs'].forEach((v) {
        favorite.add(v);
      });
    }
    email = snapshot["email"] ?? '';
    id = snapshot["id"] ?? '';
    image = snapshot["imageUrl"] ?? '';
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    // name = snapshot[NAME];
    firstName = snapshot["name"];
    secondName = snapshot['secondName'];
    phone = snapshot["phoneNumber"];
    city = snapshot["city"];
    if (snapshot['favs'] != null) {
      favorite = List<String>();
      snapshot['favs'].forEach((v) {
        favorite.add(v);
      });
    }
    email = snapshot[EMAIL];
    id = snapshot["id"];
    image = snapshot["imageUrl"];
  }
}
