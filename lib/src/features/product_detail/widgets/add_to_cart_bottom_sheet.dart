import 'package:e_commerce_ui/src/features/product_detail/product_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';
import '../../../methods/calculate_price_after_discount.dart';
import '../../../themes/app_colors.dart';
import 'color_selector_widget.dart';
import 'quantity_selector_widget.dart';
import 'size_selector_widget.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final List<String> availableSizes;
  final List<Color> availableColors;
  final double price;
  final int discount;

  const AddToCartBottomSheet({
    Key? key,
    required this.availableSizes,
    required this.availableColors,
    required this.price,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailProvider = Provider.of<ProductDetailProvider>(context);
    return Container(
      padding: EdgeInsets.all(
        16.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select Options',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Sizes:',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreyShade,
                ),
              ),
              SizeSelectorWidget(
                availableSizes: availableSizes,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Available Colors:',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreyShade,
                ),
              ),
              ColorSelectorWidget(
                availableColors: availableColors,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$${(calculateFinalPriceAfterDiscount(price, discount) * productDetailProvider.quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              const QuantitySelectorWidget(),
            ],
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              // Add to Cart logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
