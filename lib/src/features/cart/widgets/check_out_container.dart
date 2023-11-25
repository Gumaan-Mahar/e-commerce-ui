import 'package:e_commerce_ui/src/features/cart/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(
        16.w,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
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
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
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
