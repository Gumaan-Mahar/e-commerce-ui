import 'package:e_commerce_ui/src/features/product_detail/product_detail_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';

class SizeSelectorWidget extends StatelessWidget {
  final List<String> availableSizes;
  const SizeSelectorWidget({
    super.key,
    required this.availableSizes,
  });

  @override
  Widget build(BuildContext context) {
    final productDetailProvider = Provider.of<ProductDetailProvider>(context);
    return Row(
      children: List.generate(
        availableSizes.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: 8.w,
          ),
          child: GestureDetector(
            onTap: () =>
                {productDetailProvider.updateSelectedSize(newValue: index)},
            child: Container(
              padding: EdgeInsets.all(
                8.w,
              ),
              decoration: BoxDecoration(
                color: productDetailProvider.selectedSizeIndex == index
                    ? Colors.blue
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  8.w,
                ),
              ),
              child: Text(
                availableSizes[index],
                style: TextStyle(
                  color: productDetailProvider.selectedSizeIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
