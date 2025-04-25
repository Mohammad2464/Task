import 'package:get/get.dart';

import '../../models/category/categories_model.dart';
import '../../repository/categories_repository.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  final RxList<Categories> categories = <Categories>[].obs;
  var allcategories = <Categories>[].obs;

  var errorMessage = ''.obs;

  final CategoryRepository _categoryRepository = CategoryRepository();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final data = await _categoryRepository.fetchCategories();
      print("Fetched categories: $data");
      for (var category in data) {
        print("Category: ${category.name}, Image URL: ${category.url}");
      }
      allcategories.assignAll(data);
      categories.assignAll(data);
    } catch (e) {
      print("Error fetching categories: $e");

      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      categories.assignAll(allcategories);
    } else {
      categories.assignAll(
        allcategories.where(
          (p) => p.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
