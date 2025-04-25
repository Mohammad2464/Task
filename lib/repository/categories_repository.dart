import 'package:test_task/resources/api_endpoints.dart';

import '../models/category/categories_model.dart';
import '../network_data/network/NetworkApiService.dart';

class CategoryRepository {
  final _apiService = NetworkApiService();
  Future<List<Categories>> fetchCategories() async {
  try {
    var response = await _apiService.getGetApiResponse(ApiEndPoints.categories);
    print('Categories API response: $response');
    List<Categories> categories = List<Categories>.from(
      response.map((x) => Categories.fromJson(x)),
    );

    await Future.wait(categories.map((category) async {
      try {
        if (category.url != null && category.url!.isNotEmpty) {
          var categoryData = await _apiService.getGetApiResponse(category.url!);
          print('Category data for ${category.name}: $categoryData');
          if (categoryData is Map &&
              categoryData['products'] != null &&
              categoryData['products'].isNotEmpty &&
              categoryData['products'][0]['thumbnail'] != null) {
            category.imageUrl = categoryData['products'][0]['thumbnail'];
          } else {
            category.imageUrl = 'https://via.placeholder.com/150';
            print('No valid thumbnail for ${category.name}');
          }
        } else {
          category.imageUrl = 'https://via.placeholder.com/150';
          print('Warning: Null or empty URL for ${category.name}');
        }
      } catch (e) {
        print('Error fetching image for ${category.name}: $e');
        category.imageUrl = 'https://via.placeholder.com/150';
      }
    }));
    return categories;
  } catch (e) {
    print('Error fetching categories: $e');
    rethrow;
  }
}


 
}
