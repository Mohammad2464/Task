import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/resources/app_strings.dart';

import 'account_Screen.dart';
import 'categories_Screen.dart';
import 'favourite_Screen.dart';
import 'products_screen.dart';

class MainScreen extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: screens[selectedIndex.value],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: 75,
              color: Colors.black,
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, 'products.png', 'Products'),
                    _buildNavItem(1, 'categories.png', 'Categories'),
                    _buildNavItem(2, 'favourite.png', 'Favourites'),
                    _buildNavItem(3, 'person.png', 'Mitt konto'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconName, String label) {
    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '${AppStrings.imagePath}$iconName',
            height: 21,
            color: AppColors.white,
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: AppColors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
