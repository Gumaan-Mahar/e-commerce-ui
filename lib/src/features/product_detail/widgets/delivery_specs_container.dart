import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class DeliverySpecsContainer extends StatelessWidget {
  const DeliverySpecsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            isThreeLine: true,
            leading: Text(
              'Delivery',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
            title: Text(
              'Standard Delivery',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text:
                    'Enjoy free shipping promotion with a minimum spend of \$500 from ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
                children: [
                  TextSpan(
                    text: 'Store Name Here',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: darkMode ? Colors.grey.shade700 : Colors.grey.shade300,
            height: 0,
            thickness: 1,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            leading: Text(
              'Service',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
            title: Text(
              '14 days free & easy return',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            subtitle: Text(
              'Warranty not available',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
