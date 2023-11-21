import 'package:e_commerce_ui/src/features/home/widgets/see_more_button.dart';
import 'package:e_commerce_ui/src/models/product.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import 'product_tile_widget.dart';

class ProductsListTile extends StatelessWidget {
  const ProductsListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.products,
  }) : super(key: key);

  final String title;
  final String description;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    final screenWidth = Constants.getScreenWidth(context);
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.7,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SeeMoreButton(
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: screenHeight * 0.28,
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTileWidget(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
