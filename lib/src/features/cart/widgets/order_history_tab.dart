import 'package:e_commerce_ui/src/features/cart/cart_provider.dart';
import 'package:e_commerce_ui/src/features/cart/widgets/order_history_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';

class OrderHistoryTab extends StatelessWidget {
  const OrderHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: 8.h,
            ),
            child: ListView.builder(
              itemCount: cartProvider.dummyPastOrders.length,
              itemBuilder: (_, index) {
                final pastOrderDetails = cartProvider.dummyPastOrders[index];
                return OrderHistoryCard(
                  orderNumber: pastOrderDetails.orderNumber,
                  orderDateTime: pastOrderDetails.orderDateTime,
                  orderStatus: pastOrderDetails.orderStatus,
                  products: pastOrderDetails.products,
                  orderLocation: pastOrderDetails.orderLocation,
                  totalAmount: pastOrderDetails.totalAmount,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
