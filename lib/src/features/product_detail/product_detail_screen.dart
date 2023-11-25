import 'package:e_commerce_ui/src/features/product_detail/product_detail_provider.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/add_to_cart_bottom_sheet.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/delivery_specs_container.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/product_details_widget.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/product_ratings_container.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/product_variations.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/q_and_a_section.dart';
import 'package:e_commerce_ui/src/features/product_detail/widgets/reviews_section.dart';
import 'package:e_commerce_ui/src/models/product.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/global_imports.dart';
import '../../methods/calculate_price_after_discount.dart';
import 'widgets/store_details_container.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    final productDetailProvider = Provider.of<ProductDetailProvider>(context);
    return PopScope(
      onPopInvoked: (didPop) {
        didPop ? productDetailProvider.resetValues() : null;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  inherit: true,
                ),
          ),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              productDetailProvider.resetValues();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
              size: 22.w,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 22.w,
                color: AppColors.primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<ProductDetailProvider>(
          builder: (context, productDetailProvider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 300.h,
                    child: PageView.builder(
                      onPageChanged: (newPage) => {
                        productDetailProvider.updateCurrentPageValue(
                            newPage: newPage)
                      },
                      itemCount: widget.product.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.product.imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.product.imageUrls.map((image) {
                      int index = widget.product.imageUrls.indexOf(image);
                      return Container(
                        width: productDetailProvider.currentPageValue == index
                            ? 16.w
                            : 6.w,
                        height: 6.h,
                        margin: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 2.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              productDetailProvider.currentPageValue == index
                                  ? BorderRadius.circular(
                                      4.0,
                                    )
                                  : null,
                          shape: productDetailProvider.currentPageValue == index
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          color: productDetailProvider.currentPageValue == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: darkMode
                              ? AppColors.darkShade
                              : AppColors.lightShade,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    (widget.product.discount > 0)
                                        ? Row(
                                            children: [
                                              Text(
                                                '\$${widget.product.price.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                '-${widget.product.discount.toStringAsFixed(0)}%',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    Text(
                                      '\$${calculateFinalPriceAfterDiscount(widget.product.price, widget.product.discount)}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              widget.product.subInfo,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            ProductRatingsContainer(
                              productRating: double.parse(
                                  widget.product.rating.toStringAsFixed(1)),
                              totalRatings: 5,
                              peopleRated: widget.product.ratingQuantity,
                              timesSold: 523,
                              timesAddedToWishlist: 124,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const DeliverySpecsContainer(),
                      SizedBox(
                        height: 4.h,
                      ),
                      VariationsSection(
                        title: 'Variations',
                        variants: widget.product.imageUrls,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      ProductDetailWidget(
                        productDetails: widget.product.highlights,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: darkMode
                              ? AppColors.darkShade
                              : AppColors.lightShade,
                        ),
                        child: const RatingsAndReviewsSection(
                          totalRatings: 138,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: darkMode
                              ? AppColors.darkShade
                              : AppColors.lightShade,
                        ),
                        child: const QAndASection(),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const StoreDetailsContainer(
                        storeName: 'Yellow Stone Cosmetics',
                        storeImage:
                            'assets/images/product_images/product_2.jpg',
                        followersCount: 132,
                        positiveRatings: 88.07,
                        onTimeShipment: 95,
                        chatResponseRate: 98,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 80.h,
          padding:
              EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w, bottom: 16.h),
          decoration: BoxDecoration(
            color: darkMode ? AppColors.darkShade : AppColors.lightShade,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGreyShade.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.storefront_outlined,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        'Store',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.chat,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () async => await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddToCartBottomSheet(
                          availableSizes: widget.product.availableSizes,
                          availableColors: widget.product.availableColors,
                          price: widget.product.price,
                          discount: widget.product.discount,
                        );
                      },
                    ),
                    child: const Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.lightShade,
                    ),
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
