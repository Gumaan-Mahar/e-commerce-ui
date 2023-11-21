import 'dart:math';

import '../models/brand.dart';
import '../models/category.dart';
import '../models/product.dart';
import 'global_imports.dart';

enum DeliveryStatus {
  delivered,
  shipped,
  failed,
  processing,
}

class Constants {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static List<Brand> popularBrands = [
    Brand(
      id: '1',
      name: 'Gucci',
      logoUrl: 'assets/brands/gucci.jpeg',
    ),
    Brand(
      id: '2',
      name: 'Adidas',
      logoUrl: 'assets/brands/adidas.png',
    ),
    Brand(
      id: '3',
      name: 'Apple',
      logoUrl: 'assets/brands/apple.jpeg',
    ),
    Brand(
      id: '4',
      name: 'Samsung',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '5',
      name: 'Sony',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '6',
      name: 'LG',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '7',
      name: 'Canon',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '8',
      name: 'Lenovo',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '9',
      name: 'Xiaomi',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '10',
      name: 'Samsung',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '11',
      name: 'Puma',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '12',
      name: 'Bose',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '13',
      name: 'Vans',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '14',
      name: 'Rolex',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
    Brand(
      id: '15',
      name: 'Levi\'s',
      logoUrl: 'assets/images/banners/banner_3.jpg',
    ),
  ];

  static List<Category> categories = [
    Category(
        id: '1',
        name: 'Electronics',
        imageUrl: 'assets/images/categories_images/electronics.jpg'),
    Category(
        id: '2',
        name: 'Clothing',
        imageUrl: 'assets/images/categories_images/clothing.jpg'),
    Category(
        id: '3',
        name: 'Home & Kitchen',
        imageUrl: 'assets/images/categories_images/home_kitchen.jpg'),
    Category(
        id: '4',
        name: 'Toys & Games',
        imageUrl: 'assets/images/categories_images/toys.jpg'),
    Category(
        id: '5',
        name: 'Beauty & Personal Care',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '6', name: 'Books', imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '7',
        name: 'Sports & Outdoors',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '8',
        name: 'Health & Wellness',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '9',
        name: 'Furniture',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '10',
        name: 'Jewelry',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '11',
        name: 'Automotive',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '12',
        name: 'Groceries',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '13', name: 'Pets', imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '14',
        name: 'Elecimages/banners/banner_3.jpg',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '15',
        name: 'Art & Crafts',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '16',
        name: 'Garden & Outdoor',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '17',
        name: 'Watches',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '18',
        name: 'Baby & Kids',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '19',
        name: 'Computers',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '20',
        name: 'Movies & Music',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '21',
        name: 'Shoes',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '22',
        name: 'Office Supplies',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '23',
        name: 'Tools & Home Improvement',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '24',
        name: 'Industrial & Scientific',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '25',
        name: 'Luggage & Travel',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '26',
        name: 'Handmade',
        imageUrl: 'assets/images/categories_images/handmade.jpg'),
    Category(
        id: '27',
        name: 'Video Games',
        imageUrl: 'assets/images/categories_images/video_games.jpg'),
    Category(
        id: '28',
        name: 'Musical Instruments',
        imageUrl: 'assets/images/categories_images/musicals.jpg'),
    Category(
        id: '29',
        name: 'Smartphones & Accessories',
        imageUrl: 'assets/images/categories_images/smartphones.jpg'),
    Category(
        id: '30', name: 'Software', imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '31',
        name: 'Food & Beverages',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '32',
        name: 'Cameras & Photography',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '33',
        name: 'Fitness & Exercise',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '34',
        name: 'Music & Instruments',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '35',
        name: 'Stationery',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '36',
        name: 'Outdoor & Adventure',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '37',
        name: 'Cookware & Dining',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '38',
        name: 'Travel Accessories',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '39',
        name: 'Fashion Accessories',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '40',
        name: 'Bicycles & Accessories',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '41',
        name: 'Gaming Consoles',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '42',
        name: 'Beauty & Fragrances',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '43',
        name: 'Home Decor',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '44',
        name: 'Mobile Accessories',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '45',
        name: 'Books & Audible',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '46',
        name: 'Bags & Wallets',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '47',
        name: 'Wine & Spirits',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '48',
        name: 'Fitness & Sports Equipment',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '49',
        name: 'Baby Clothing',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
    Category(
        id: '50',
        name: 'Fragrance & Perfume',
        imageUrl: 'assets/images/banners/banner_3.jpg'),
  ];

  static List<int> _generateRandomImageIndices(int count) {
    final List<int> indices = [];
    final Random random = Random();

    for (int i = 1; i <= count; i++) {
      indices.add(random.nextInt(100) + 1);
    }

    return indices;
  }

  static List<Product> generateRandomProducts(
    List<Category> categories,
    List<Brand> brands,
    int numberOfProducts,
  ) {
    final List<Product> products = [];
    final Random random = Random();

    for (int i = 1; i <= numberOfProducts; i++) {
      final Category randomCategory =
          categories[random.nextInt(categories.length)];
      final Brand randomBrand = brands[random.nextInt(brands.length)];

      final Product product = Product(
        name: 'Here comes the name of the Product $i',
        subInfo: 'Here comes the sub info of the product called Product $i',
        category: randomCategory,
        brand: randomBrand,
        price: (random.nextDouble() * 100) + 10,
        discount: random.nextInt(60),
        rating: (random.nextDouble() * 5),
        ratingQuantity: random.nextInt(500),
        highlights: [
          'Here comes the first specification of the product',
          'Here comes the second specification of the product',
          'Here comes the third specification of the product'
        ],
        availableSizes: ['S', 'M', 'L', 'XL'],
        availableColors: [Colors.red, Colors.blue, Colors.green, Colors.yellow],
        imageUrls: _generateRandomImageIndices(4)
            .map((index) => 'assets/images/product_images/product_$index.jpg')
            .toList(),
      );

      products.add(product);
    }

    return products;
  }
}
