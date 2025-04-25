
import 'dart:convert';

import 'product_model.dart';

class Products {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };

  static Products fromRawJson(String str) => Products.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
}







