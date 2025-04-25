import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/controllers/favourite_controller.dart';
import '../widgets/favourite_card.dart';
import '../widgets/search_field.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});
  final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              const Text(
                "Favourite",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              SearchField(onChanged: controller.filteredfavourites),
              const SizedBox(height: 16),
              Obx(() {
                if (controller.favourites.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'No favourite items yet.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.favourites.length,
                    itemBuilder: (context, index) {
                      final product = controller.favourites[index];
                      return FavouriteItem(product: product);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
