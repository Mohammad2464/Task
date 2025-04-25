import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/controllers/categories_controller.dart';
import '../widgets/categories_card.dart';
import '../widgets/search_field.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            const Text(
              "Categories",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SearchField(onChanged: controller.filterCategories),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.categories.isEmpty) {
                  return const Center(child: Text("No categories found"));
                } else {
                  return GridView.builder(
                    itemCount: controller.categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 13,
                          childAspectRatio: 1.3,
                        ),
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return CategoryCard(category: category);
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
