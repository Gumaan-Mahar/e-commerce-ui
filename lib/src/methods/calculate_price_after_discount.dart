double calculateFinalPriceAfterDiscount(
      double originalPrice, int discountPercentage) {
    if (originalPrice <= 0 ||
        discountPercentage < 0 ||
        discountPercentage > 100) {
      throw ArgumentError("Invalid input values");
    }

    double discountAmount = (originalPrice * discountPercentage) / 100;
    double finalPrice = originalPrice - discountAmount;

    return double.parse(finalPrice.toStringAsFixed(2));
  }