import 'package:flutter/material.dart';
import 'package:kopamain/domain/models/sneaker_model.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/data_widgets/products_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';

import '../../navigation_screen_controller.dart';

Widget searchItem(context, MainScreenController controller,
    SneakerModel sneaker, NavigationController nc, UserFavoriteController ufc) {
  if (controller.searchQuery.trim().isNotEmpty) {
    if (sneaker.brand
        .toLowerCase()
        .contains(controller.searchQuery.toLowerCase())) {
      return productsView(sneaker, controller, nc, ufc);
    } else if (sneaker.size
        .toLowerCase()
        .contains(controller.searchQuery.toLowerCase())) {
      return productsView(sneaker, controller, nc, ufc);
    } else if (sneaker.material
        .toLowerCase()
        .contains(controller.searchQuery.toLowerCase())) {
      return productsView(sneaker, controller, nc, ufc);
    } else if (sneaker.price
        .toLowerCase()
        .contains(controller.searchQuery.toLowerCase())) {
      return productsView(sneaker, controller, nc, ufc);
    } else
      return const Offstage();
  } else
    return productsView(sneaker, controller, nc, ufc);
}
