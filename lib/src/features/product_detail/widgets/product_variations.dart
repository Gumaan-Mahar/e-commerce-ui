import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class VariationsSection extends StatelessWidget {
  final String title;
  final List<String> variants;
  const VariationsSection({
    Key? key,
    required this.title,
    required this.variants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      padding: EdgeInsets.all(12.w),
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
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: variants
                .map(
                  (variant) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        variant,
                        width: 50.w,
                        height: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
