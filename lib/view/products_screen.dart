import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/resources/app_colors.dart';

import '../view_models/controllers/products_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductController controller = Get.put(ProductController());
@override
  void initState() {
    controller.resetProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(21.0),
        child: Column(
          children: [
            Text(
              "Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16),
            SearchField(onChanged: controller.filterProducts),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                } else if (controller.products.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products match your search.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(product: product);
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
