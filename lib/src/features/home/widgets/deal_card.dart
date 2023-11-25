import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';
import 'countdown_widget.dart';
import 'deal_category_chip.dart';

class DealCard extends StatelessWidget {
  final String dealName;
  final int discount;
  final int countdownHours;
  final String title;
  final List<String> images;

  const DealCard({
    super.key,
    required this.dealName,
    required this.discount,
    required this.countdownHours,
    required this.title,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    final screenWidth = Constants.getScreenWidth(context);
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      width: screenWidth * 0.6,
      margin: EdgeInsets.only(right: 4.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          color: darkMode ? AppColors.darkGreyShade : AppColors.lightGreyShade,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.26,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 4.h),
          CategoryChip(category: dealName),
          // Text(
          //   dealName,
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         inherit: true,
          //         color: AppColors.primaryColor,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 2.h,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: Text(
              '$discount% OFF',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.lightShade,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          CountdownWidget(
            countdownHours: countdownHours,
            formattedCountdown:
                formatCountdown(Duration(hours: countdownHours.toInt())),
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
