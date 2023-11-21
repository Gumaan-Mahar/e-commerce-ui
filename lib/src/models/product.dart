import 'package:e_commerce_ui/src/core/global_imports.dart';

import 'brand.dart';
import 'category.dart';

class Product {
  final String name;
  final String subInfo;
  final Category category;
  final Brand brand;
  final double price;
  final int discount;
  final double rating;
  final int ratingQuantity;
  final List<String> highlights;
  final List<String> availableSizes;
  final List<Color> availableColors;
  final List<String> imageUrls;

  Product({
    required this.name,
    required this.subInfo,
    required this.category,
    required this.brand,
    required this.price,
    required this.discount,
    required this.rating,
    required this.ratingQuantity,
    required this.highlights,
    required this.availableSizes,
    required this.availableColors,
    required this.imageUrls,
  });
}
