import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import 'deal_card.dart';

class DealsListTile extends StatelessWidget {
  const DealsListTile({
    super.key,
    required this.dealTitle,
    required this.dealDescription,
    required this.deals,
  });

  final String dealTitle;
  final String dealDescription;
  final List<DealCard> deals;

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dealTitle,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 2.h),
          Text(
            dealDescription,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: darkMode ? AppColors.darkShade : AppColors.lightShade,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: deals.map((deal) => deal).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
