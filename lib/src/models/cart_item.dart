class CartItem {
  final String productName;
  final String subInfo;
  final String image;
  final double price;
  int quantity;

  CartItem(
      {required this.productName,
      required this.subInfo,
      required this.image,
      required this.price,
      required this.quantity});
}
