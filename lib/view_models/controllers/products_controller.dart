import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../models/product/product_model.dart';
import '../../models/product/products_model.dart';
import '../../repository/products_repository.dart';
import '../../resources/utils.dart';

class ProductController extends GetxController {
  final ProductRepository _repository = ProductRepository();

  var products = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var allProducts = <Product>[].obs;
  var categoryByProducts = <Product>[].obs;
    var filterCateogoryProducts = <Product>[].obs;

  var isCategoryMode = false.obs;

  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  void fetchAllProducts() async {
    try {
      isLoading(true);
      isCategoryMode(false);
      Products result = await _repository.fetchProducts();
      allProducts.assignAll(result.products);
      products.assignAll(result.products);
    } catch (e) {
      errorMessage(e.toString());
      hanldeError(e, Get.context);
    } finally {
      isLoading(false);
    }
  }
void fetchProductsByCategory(String categoryUrl) async {
  try {
    isLoading(true);
    isCategoryMode(true);
    final data = await _repository.fetchProductsByCategory(categoryUrl);
    print('Products for category $categoryUrl: $data');
    categoryByProducts.assignAll(data);
    products.assignAll(data);
    filterCateogoryProducts.assignAll(data);
  } catch (e) {
    errorMessage.value = e.toString();
    print('Error fetching products for $categoryUrl: $e');
    hanldeError(e, Get.context);
  } finally {
    isLoading(false);
  }
}
void resetProducts() {
    isCategoryMode(false);
    products.assignAll(allProducts);
    filterCateogoryProducts.clear(); 
    errorMessage.value = '';
  }
 
  void filterProducts(String query) {
    final source = isCategoryMode.value ? filterCateogoryProducts  : allProducts;
    if (query.isEmpty) {
      products.assignAll(source);
    } else {
      products.assignAll(
        source.where(
          (p) => p.title.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  hanldeError(error, context) {
    EasyLoading.dismiss();
    log("error $error");
    log("stackTrace $error.stackTrace");

    if (error.toString().contains("Error Occured while ")) {
      Utils.errorSnakbar(context, error.toString());
    } else if (error.toString().contains(
      "Error During Communication No Internet Connection",
    )) {
      Utils.errorSnakbar(context, "No Internet Connection");
    } else {
      Utils.errorSnakbar(context, error.toString());
    }
  }
}
