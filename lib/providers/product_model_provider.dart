import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id ; //7
  final String brand; //6
  final String size; //2
  final String length; //4
  final String width; //1
  final String material; //3
  final String imageUrl; //5
  bool isFavorite;
  Product({
     this.brand,
    @override this.imageUrl,
    @override this.id,
    @override this.size,
    @override this.length,
    @override this.width,
    @override this.material,
    this.isFavorite = false,
  });
}
