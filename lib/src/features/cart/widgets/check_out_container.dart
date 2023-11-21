import 'package:e_commerce_ui/src/features/cart/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(
        16.w,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(
          12.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      inherit: true,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                '\$${cartProvider.calculateTotalPrice(cartProvider.cartItems).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      inherit: true,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Proceed to Checkout',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    inherit: true,
                    color: AppColors.lightShade,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
