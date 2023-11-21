import 'package:e_commerce_ui/src/features/notifications/notifications_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class PromotionNotificationContainer extends StatelessWidget {
  final String title;
  final DateTime createdAt;
  final String message;
  final String image;
  final bool showBadge;

  const PromotionNotificationContainer({
    super.key,
    required this.title,
    required this.createdAt,
    required this.message,
    required this.image,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.getScreenWidth(context);
    final notificationProvider = Provider.of<NotificationsProvider>(context);
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Container(
      margin: EdgeInsets.only(
        bottom: 4.h,
      ),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w,),
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
          Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      8.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.darkGreyShade.withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.local_activity_outlined,
                      size: 22.w,
                      color: AppColors.lightShade,
                    ),
                  ),
                  showBadge
                      ? Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              color: darkMode
                                  ? AppColors.darkShade
                                  : AppColors.lightShade,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            inherit: true,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  // SizedBox(height: 8),
                  Text(
                    notificationProvider.calculateTimeAgo(createdAt),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: screenWidth * 0.9,
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.darkGreyShade.withOpacity(
                  0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
