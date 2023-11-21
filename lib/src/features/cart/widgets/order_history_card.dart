import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../models/cart_item.dart';
import '../../../themes/app_colors.dart';

class OrderHistoryCard extends StatelessWidget {
  final String orderNumber;
  final String orderDateTime;
  final DeliveryStatus orderStatus;
  final List<CartItem> products;
  final String orderLocation;
  final double totalAmount;

  const OrderHistoryCard({
    super.key,
    required this.orderNumber,
    required this.orderDateTime,
    required this.orderStatus,
    required this.products,
    required this.orderLocation,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Constants.getScreenWidth(context);
    final bool darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 4.h,),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderNumber,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            inherit: true,
                            color: AppColors.primaryColor,
                          ),
                    ),
                    Text(
                      orderDateTime,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            inherit: true,
                            color: AppColors.darkGreyShade.withOpacity(
                              0.8,
                            ),
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      color: orderStatus == DeliveryStatus.delivered
                          ? Colors.green
                          : orderStatus == DeliveryStatus.failed
                              ? Colors.red
                              : orderStatus == DeliveryStatus.processing
                                  ? Colors.orange
                                  : orderStatus == DeliveryStatus.shipped
                                      ? Colors.blue
                                      : Colors.black,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      orderStatus == DeliveryStatus.delivered
                          ? 'Delivered'
                          : orderStatus == DeliveryStatus.failed
                              ? 'Failed'
                              : orderStatus == DeliveryStatus.processing
                                  ? 'Processing'
                                  : orderStatus == DeliveryStatus.shipped
                                      ? 'Shipped'
                                      : '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: orderStatus == DeliveryStatus.delivered
                            ? Colors.green
                            : orderStatus == DeliveryStatus.failed
                                ? Colors.red
                                : orderStatus == DeliveryStatus.processing
                                    ? Colors.orange
                                    : orderStatus == DeliveryStatus.shipped
                                        ? Colors.blue
                                        : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  children: products.map(
                    (product) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.5,
                                child: Text(
                                  product.productName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        inherit: true,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${product.quantity} pcs',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          inherit: true,
                                          color: AppColors.darkGreyShade,
                                        ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                  ),
                                  Text(
                                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          inherit: true,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          product != products.last
                              ? const Divider()
                              : SizedBox(
                                  height: 16.h,
                                ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 16.w,
            ),
            color: darkMode ? AppColors.darkShade : AppColors.lightShade,
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primaryColor,
                      size: 28.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                      width: screenWidth * 0.52,
                      child: Text(
                        orderLocation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              inherit: true,
                              fontSize: 13.sp,
                              color: AppColors.darkGreyShade,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            inherit: true,
                            color: AppColors.darkGreyShade.withOpacity(
                              0.8,
                            ),
                          ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            inherit: true,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
