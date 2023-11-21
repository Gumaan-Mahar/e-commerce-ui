import 'package:e_commerce_ui/src/features/cart/cart_provider.dart';
import 'package:e_commerce_ui/src/features/cart/widgets/check_out_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class CurrentOrderTab extends StatelessWidget {
  const CurrentOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Constants.getScreenWidth(context);
    final bool darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: 8.h,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: darkMode
                              ? AppColors.darkShade
                              : AppColors.lightShade,
                          borderRadius: BorderRadius.circular(
                            12.w,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.w),
                              child: Image.asset(
                                item.image,
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.6,
                                  child: Text(
                                    item.productName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          inherit: true,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.6,
                                  child: Text(
                                    item.subInfo,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          inherit: true,
                                          color: AppColors.darkGreyShade
                                              .withOpacity(
                                            0.8,
                                          ),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${item.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            inherit: true,
                                            color: AppColors.darkGreyShade,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => {
                                            cartProvider.decrementItemQuantity(
                                              item: item,
                                            )
                                          },
                                          child: Icon(
                                            Icons
                                                .indeterminate_check_box_outlined,
                                            size: 22.w,
                                            color: AppColors.darkGreyShade
                                                .withOpacity(
                                              darkMode ? 0.8 : 0.4,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          item.quantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                inherit: true,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        GestureDetector(
                                          onTap: () => {
                                            cartProvider.incrementItemQuantity(
                                              item: item,
                                            )
                                          },
                                          child: Icon(
                                            Icons.add_box_outlined,
                                            size: 22.w,
                                            color: AppColors.darkGreyShade
                                                .withOpacity(
                                              darkMode ? 0.8 : 0.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Move to Wishlist',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              inherit: true,
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.12,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Remove',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              inherit: true,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const CheckoutContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
