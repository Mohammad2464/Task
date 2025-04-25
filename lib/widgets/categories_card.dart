import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/models/category/categories_model.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/widgets/network_image.dart';

import '../view/productsby_category.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            print('Tapped on: ${category.name}, url: ${category.url}');

            Get.to(() => ProductsByCategoryScreen(category: category));
          },

          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: DisplayNetworkImage(
                  image: category.imageUrl,
                  height: 100,
                  width: 100,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
