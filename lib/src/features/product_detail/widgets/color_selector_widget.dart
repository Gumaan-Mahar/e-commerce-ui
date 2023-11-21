import 'package:e_commerce_ui/src/features/product_detail/product_detail_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';

class ColorSelectorWidget extends StatelessWidget {
  final List<Color> availableColors;
  const ColorSelectorWidget({
    super.key,
    required this.availableColors,
  });

  @override
  Widget build(BuildContext context) {
    final productDetailProvider = Provider.of<ProductDetailProvider>(context);
    return Row(
      children: List.generate(
        availableColors.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: 8.w,
          ),
          child: GestureDetector(
            onTap: () => {
              productDetailProvider.updateSelectedColor(newColorValue: index)
            },
            child: Container(
              width: 30.w,
              height: 30.h,
              margin: EdgeInsets.all(
                2.w,
              ),
              decoration: BoxDecoration(
                color: availableColors[index],
                shape: BoxShape.circle,
                border: index == productDetailProvider.selectedColorIndex
                    ? Border.all(
                        color: Colors.black,
                        width: 4.w,
                      )
                    : const Border(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
