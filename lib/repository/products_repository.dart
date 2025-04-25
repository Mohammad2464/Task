import 'package:test_task/resources/api_endpoints.dart';
import '../models/product/product_model.dart';
import '../models/product/products_model.dart';
import '../network_data/network/BaseApiServices.dart';
import '../network_data/network/NetworkApiService.dart';

class ProductRepository {
  final BaseApiServices _apiService = NetworkApiService();

  Future<Products> fetchProducts() async {
    try {
      final response = await _apiService.getGetApiResponse(
        ApiEndPoints.products,
      );
      return Products.fromJson(response);
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }
    Future<List<Product>> fetchProductsByCategory(String categoryUrl) async {
    final response = await _apiService.getGetApiResponse(categoryUrl);
    List productsJson = response['products'];
    return productsJson.map((e) => Product.fromJson(e)).toList();
  }
}
