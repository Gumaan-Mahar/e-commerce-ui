import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/core/global_imports.dart';
import 'package:e_commerce_ui/src/models/product.dart';

class HomeProvider extends ChangeNotifier {
  // Banner Images
  final List<String> bannerImages = [
    'assets/images/banners/banner_2.jpg',
    'assets/images/banners/banner_3.jpg',
    'assets/images/banners/banner_4.jpg',
    'assets/images/banners/banner_5.jpg',
  ];

  final PageController pageController = PageController(viewportFraction: 0.9);
  int _currentBannerIndex = 0;
  int get currentBannerIndex => _currentBannerIndex;

  void changeBanner(int index) {
    _currentBannerIndex = index;
    notifyListeners();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentBannerIndex < bannerImages.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      _startAutoScroll();
    });
  }

  // Products
  final List<Product> products = Constants.generateRandomProducts(
    Constants.categories,
    Constants.popularBrands,
    100,
  );

  // Init and Dispose
  HomeProvider() {
    _startAutoScroll();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
