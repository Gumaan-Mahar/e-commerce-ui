import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(2.w),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.primaryColor, Colors.pink],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          category,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.lightShade,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
