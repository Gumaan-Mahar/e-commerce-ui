import 'package:e_commerce_ui/src/features/product_detail/product_detail_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/global_imports.dart';

class QuantitySelectorWidget extends StatelessWidget {
  const QuantitySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailProvider = Provider.of<ProductDetailProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => productDetailProvider.decrementQuantity(),
            child: Icon(
              Icons.remove,
              size: 24.w,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            productDetailProvider.quantity.toString(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 12.w),
          InkWell(
            onTap: () => productDetailProvider.incrementQuantity(),
            child: Icon(
              Icons.add,
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
