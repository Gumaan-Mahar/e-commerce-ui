import 'package:e_commerce_ui/src/features/product_detail/product_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../methods/calculate_price_after_discount.dart';
import '../../../models/product.dart';
import '../../../themes/app_colors.dart';

class ProductTileWidget extends StatelessWidget {
  final Product product;
  final double? imageHeight;

  const ProductTileWidget({
    super.key,
    required this.product,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    final screenWidth = Constants.getScreenWidth(context);
    final screenHeight = Constants.getScreenHeight(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(product: product),
        ),
      ),
      child: Container(
        width: screenWidth * 0.4,
        margin: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        decoration: BoxDecoration(
          color: darkMode ? AppColors.darkShade : AppColors.lightShade,
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
            color: darkMode
                ? AppColors.charcoalDarkShade
                : AppColors.lightGreyShade,
            width: 0.8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: imageHeight ?? screenHeight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.w),
                      topRight: Radius.circular(12.w),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.w),
                      topRight: Radius.circular(12.w),
                    ),
                    child: Image.asset(
                      product.imageUrls[0],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                product.discount > 0
                    ? Container(
                        margin: EdgeInsets.all(8.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2.w,
                              blurRadius: 5.w,
                              offset: Offset(0.w, 2.w),
                            ),
                          ],
                        ),
                        child: Text(
                          '${product.discount}% OFF',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 4.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${double.parse(product.price.toStringAsFixed(2))}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      inherit: true,
                                      color: product.discount != 0
                                          ? Colors.grey
                                          : Colors.red,
                                      decoration: product.discount != 0
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              product.discount == 0
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: 2.w,
                                    ),
                              product.discount != 0
                                  ? Text(
                                      '\$${calculateFinalPriceAfterDiscount(product.price, product.discount)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            inherit: true,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < product.rating
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      size: 12.w,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                '(${product.ratingQuantity})',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      inherit: true,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkGreyShade,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: AppColors.darkGreyShade,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          inherit: true,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
