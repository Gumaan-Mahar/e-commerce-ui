import 'package:e_commerce_ui/src/features/home/widgets/product_tile_widget.dart';
import 'package:e_commerce_ui/src/features/product_detail/product_detail_screen.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../models/product.dart';

class ExploreMoreSection extends StatefulWidget {
  const ExploreMoreSection({super.key});

  @override
  ExploreMoreSectionScreenState createState() =>
      ExploreMoreSectionScreenState();
}

class ExploreMoreSectionScreenState extends State<ExploreMoreSection> {
  List<Product> products = Constants.generateRandomProducts(
    Constants.categories,
    Constants.popularBrands,
    100,
  );

  int pageSize = 10;
  int currentPage = 1;

  ScrollController scrollController = ScrollController();

  bool _isLoading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _loadProducts() {
    if (!_isLoading && _hasMoreData) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        List<Product> newProducts = fetchNextProducts(10);
        if (newProducts.isEmpty) {
          setState(() {
            _hasMoreData = false;
            _isLoading = false;
          });
        } else {
          setState(() {
            products.addAll(newProducts);
            _isLoading = false;
            currentPage++;
          });
        }
      });
    }
  }

  int nextStartIndex = 0;

  List<Product> fetchNextProducts(int batchSize) {
    final List<Product> nextBatch = [];

    if (nextStartIndex >= products.length) {
      return nextBatch;
    }

    int endIndex = nextStartIndex + batchSize;
    if (endIndex >= products.length) {
      endIndex = products.length;
    }

    nextBatch.addAll(products.getRange(nextStartIndex, endIndex));
    nextStartIndex = endIndex;

    return nextBatch;
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        _hasMoreData) {
      _loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      color: darkMode ? AppColors.darkShade : AppColors.lightShade,
      padding: EdgeInsets.all(
        2.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "More products to explore",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        inherit: true,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Keep scrolling to explore more",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            controller: scrollController,
            itemCount: products.length + (_hasMoreData ? 1 : 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              if (index < products.length) {
                final product = products[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: product,
                        ),
                      ),
                    ),
                    child: ProductTileWidget(
                      product: product,
                      imageHeight: screenHeight * 0.195,
                    ),
                  ),
                );
              } else if (_isLoading) {
                return const CircularProgressIndicator();
              } else {
                return Center(
                  child: Text(
                    "You've Reached the End of Discoveries",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.darkGreyShade,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
