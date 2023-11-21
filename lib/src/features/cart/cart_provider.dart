import 'package:e_commerce_ui/src/core/constants.dart';

import '../../core/global_imports.dart';
import '../../models/cart_item.dart';
import '../../models/past_order_details.dart';

class CartProvider extends ChangeNotifier {
  void decrementItemQuantity({required CartItem item}) {
    if (item.quantity > 1) {
      item.quantity -= 1;
      notifyListeners();
    }
  }

  void incrementItemQuantity({required CartItem item}) {
    item.quantity += 1;
    notifyListeners();
  }

  double calculateTotalPrice(List<CartItem> items) {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  List<CartItem> cartItems = [
    CartItem(
      productName: 'Wooden Bookshelf',
      price: 199,
      quantity: 1,
      subInfo: 'Sub info goes here',
      image: 'assets/images/product_images/product_8.jpg',
    ),
    CartItem(
      productName: 'Rainbow-Colored Umbrella',
      price: 29.99,
      quantity: 2,
      subInfo: 'Automatic open/close, with UV-protective coating',
      image: 'assets/images/product_images/product_8.jpg',
    ),
    CartItem(
      productName: 'Gold-Plated Wristwatch',
      price: 99.99,
      quantity: 4,
      subInfo: 'Gold-plated wristwatch with precise quartz movement',
      image: 'assets/images/product_images/product_8.jpg',
    ),
    CartItem(
      productName: 'Handcrafted Wooden Spoon',
      price: 19.00,
      quantity: 3,
      subInfo: 'Sub information goes here',
      image: 'assets/images/product_images/product_8.jpg',
    ),
    CartItem(
      productName: 'Floral Patterned Curtains',
      price: 25.0,
      quantity: 4,
      subInfo: 'Sub information goes here',
      image: 'assets/images/product_images/product_8.jpg',
    ),
  ];

  final List<PastOrderDetailsModel> dummyPastOrders = [
    PastOrderDetailsModel(
      orderNumber: 'Order #33412',
      orderDateTime: 'June 15, 2023, 09:30 AM',
      orderStatus: DeliveryStatus.delivered,
      products: [
        CartItem(
          productName: 'Stainless Steel Mixing Bowls',
          price: 25.99,
          quantity: 2,
          subInfo: '',
          image: '',
        ),
        CartItem(
          productName: 'Faux Fur Throw Blanket',
          price: 12.50,
          quantity: 1,
          subInfo: '',
          image: '',
        ),
      ],
      orderLocation: 'New York, NY',
      totalAmount: 64.48,
    ),
    PastOrderDetailsModel(
      orderNumber: 'Order #33413',
      orderDateTime: 'June 10, 2023, 03:15 PM',
      orderStatus: DeliveryStatus.processing,
      products: [
        CartItem(
          productName: 'Product C',
          price: 19.99,
          quantity: 3,
          subInfo: '',
          image: '',
        ),
      ],
      orderLocation: 'Los Angeles, CA',
      totalAmount: 59.97,
    ),
    PastOrderDetailsModel(
      orderNumber: 'Order #33413',
      orderDateTime: 'June 10, 2023, 03:15 PM',
      orderStatus: DeliveryStatus.failed,
      products: [
        CartItem(
          productName: 'Product C',
          price: 19.99,
          quantity: 3,
          subInfo: '',
          image: '',
        ),
      ],
      orderLocation: 'Los Angeles, CA',
      totalAmount: 59.97,
    ),
    PastOrderDetailsModel(
      orderNumber: 'Order #33413',
      orderDateTime: 'June 10, 2023, 03:15 PM',
      orderStatus: DeliveryStatus.shipped,
      products: [
        CartItem(
          productName: 'Product C',
          price: 19.99,
          quantity: 3,
          subInfo: '',
          image: '',
        ),
      ],
      orderLocation: 'Los Angeles, CA',
      totalAmount: 59.97,
    ),
  ];
}
