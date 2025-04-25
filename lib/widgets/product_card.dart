import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/models/product/product_model.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/widgets/network_image.dart';

import '../view/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Container(
             decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black.withValues(alpha: 0.05),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            DisplayNetworkImage(image: product.thumbnail, height: 150, width: 288),

            Padding(
              padding: const EdgeInsets.only(
                top: 13,
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  product.rating.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(width: 5),
                        
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      size: 11,
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    'By ${product.brand}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.lightgrey.withValues(alpha: 0.50),
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    'In ${product.category}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
