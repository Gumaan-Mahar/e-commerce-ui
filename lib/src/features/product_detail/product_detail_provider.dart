import 'package:e_commerce_ui/src/core/global_imports.dart';

class ProductDetailProvider extends ChangeNotifier {
  int currentPageValue = 0;
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;
  int quantity = 1;

  updateCurrentPageValue({required int newPage}) {
    currentPageValue = newPage;
    notifyListeners();
  }

  updateSelectedSize({required int newValue}) {
    selectedSizeIndex = newValue;
    notifyListeners();
  }

  updateSelectedColor({required int newColorValue}) {
    selectedColorIndex = newColorValue;
    notifyListeners();
  }

  decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  resetValues() {
    currentPageValue = 0;
    selectedColorIndex = 0;
    quantity = 1;
    selectedSizeIndex = 0;
    notifyListeners();
  }
}