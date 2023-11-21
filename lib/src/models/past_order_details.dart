import 'package:e_commerce_ui/src/core/constants.dart';

import 'cart_item.dart';

class PastOrderDetailsModel {
  final String orderNumber;
  final String orderDateTime;
  final DeliveryStatus orderStatus;
  final List<CartItem> products;
  final String orderLocation;
  final double totalAmount;

  PastOrderDetailsModel({
    required this.orderNumber,
    required this.orderDateTime,
    required this.orderStatus,
    required this.products,
    required this.orderLocation,
    required this.totalAmount,
  });
}
