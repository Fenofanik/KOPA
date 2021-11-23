import 'package:cloud_firestore/cloud_firestore.dart';

class SneakerModel {
  String author;
  String brand;
  String id;
  List<String> image;
  String length;
  String material;
  String price;
  String size;
  bool sold;
  String width;
  String userAddAbout;
  bool favorite;

  SneakerModel(
      {this.author,
      this.brand,
      this.id,
      this.image,
      this.length,
      this.material,
      this.price,
      this.size,
      this.sold,
      this.width,
      this.favorite,
      this.userAddAbout});

  // SneakerModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   author = snapshot["author"];
  //   brand = snapshot["brand"];
  //   id = snapshot["id"];
  //   // image = snapshot["name"];
  //   if (snapshot['image'] != null) {
  //     image = List<String>();
  //     snapshot['image'].forEach((v) {
  //       image.add(v);
  //     });
  //   }
  //   length = snapshot["length"];
  //   material = snapshot["material"];
  //   price = snapshot["price"];
  //   size = snapshot["size"];
  //   sold = snapshot["sold"];
  //   width = snapshot["width"];
  //   favorite = snapshot["favorite"];
  //   userAddAbout = snapshot["userAddAbout"];
  // }

  SneakerModel.fromMap(Map snapshot)
      : author = snapshot["author"],
        brand = snapshot["brand"],
        id = snapshot['id'],
        length = snapshot["length"],
        material = snapshot["material"],
        price = snapshot["price"],
        size = snapshot["size"],
        sold = snapshot["sold"],
        width = snapshot["width"],
        favorite = snapshot["favorite"],
        userAddAbout = snapshot["userAddAbout"],
        image = snapshot['image'] != null
            ? (snapshot['image'] as List).map((e) => e.toString()).toList()
            : null;

  toJson() => {
        'id': id,
        'author': author,
        'brand': brand,
        'width': width,
        'userAddAbout': userAddAbout,
        'sold': sold,
        'size': size,
        'price': price,
        'material': material,
        'length': length,
        "favorite": favorite
      };
}
