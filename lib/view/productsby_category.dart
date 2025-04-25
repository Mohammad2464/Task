import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/controllers/products_controller.dart';
import '../models/category/categories_model.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final Categories category;

  const ProductsByCategoryScreen({super.key, required this.category});

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  final ProductController controller = Get.find<ProductController>();
  @override
  void initState() {
    print(
      'Selected category: ${widget.category.name}, url: ${widget.category.url}',
    );

    controller.fetchProductsByCategory(widget.category.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              controller.resetProducts();
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          child: Column(
            children: [
              SearchField(onChanged: controller.filterProducts),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.products.isEmpty) {
                    return const Center(child: Text("No products found"));
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
      ),
    );
  }
}
