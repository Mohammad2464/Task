import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/widgets/network_image.dart';
import '../view_models/controllers/favourite_controller.dart';
import '../models/product/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({super.key, required this.product});
  final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: DisplayNetworkImage(
                    image: product.thumbnail,
                    height: 200,
                    width: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product Details:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Obx(() {
                      final isFav = controller.isFavourite(product);
                      return IconButton(
                        onPressed: () {
                          controller.toggleFavourite(product);
                        },
                        icon: Icon(
                          isFav
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 24,
                          color: isFav ? Colors.red : AppColors.black,
                        ),
                      );
                    }),
                  ],
                ),
                ResubaleRow(label: 'Name:', value: product.title),

                ResubaleRow(label: 'Price:', value: '\$${product.price}'),

                ResubaleRow(label: 'Category:', value: product.category),

                ResubaleRow(label: 'Brand:', value: product.brand!),

                Row(
                  children: [
                    ResubaleRow(
                      label: 'Rating:',
                      value: product.rating.toString(),
                    ),

                    const SizedBox(width: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < product.rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                  ],
                ),
                ResubaleRow(label: 'Stock:', value: product.stock.toString()),

                Text(
                  'Description:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                // Product Gallery
                Text(
                  'Product Gallery:',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: DisplayNetworkImage(
                          image: product.images[index],
                          height: 150,
                          width: 150,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResubaleRow extends StatelessWidget {
  const ResubaleRow({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
