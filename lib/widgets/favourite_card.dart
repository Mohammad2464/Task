import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/models/product/product_model.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/widgets/network_image.dart';

import '../view_models/controllers/favourite_controller.dart';

class FavouriteItem extends StatelessWidget {
  final Product product;

  FavouriteItem({super.key, required this.product});
  final controller = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black.withValues(alpha: 0.05),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              ClipOval(
                child: DisplayNetworkImage(
                  image: product.thumbnail,
                  width: 62,
                  height: 62,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      product.price.toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < product.rating.floor()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.yellow,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: AppColors.red),
                onPressed: () => controller.toggleFavourite(product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
