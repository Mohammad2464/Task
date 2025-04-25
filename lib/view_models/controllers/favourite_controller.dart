import 'package:get/get.dart';
import '../../models/product/product_model.dart';

class FavouriteController extends GetxController {
  var favourites = <Product>[].obs;
  var filterfavourites = <Product>[].obs;

  void toggleFavourite(Product product) {
    if (favourites.contains(product)) {
      favourites.remove(product);
      filterfavourites.remove(product);
    } else {
      favourites.add(product);
      filterfavourites.add(product);
    }
  }

  void filteredfavourites(String query) {
    if (query.isEmpty) {
      favourites.assignAll(filterfavourites);
    } else {
      favourites.assignAll(
        filterfavourites.where(
          (p) => p.title.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  bool isFavourite(Product product) => favourites.contains(product);
}
