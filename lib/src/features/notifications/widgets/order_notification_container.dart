import 'package:e_commerce_ui/src/features/notifications/notifications_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class OrderNotificationContainer extends StatelessWidget {
  final String title;
  final DateTime createdAt;
  final String orderTrackingNumber;
  final bool showBadge;

  const OrderNotificationContainer({
    super.key,
    required this.title,
    required this.createdAt,
    required this.orderTrackingNumber,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.getScreenWidth(context);
    final notificationProvider = Provider.of<NotificationsProvider>(context);
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;

    return Container(
      margin: EdgeInsets.only(
        bottom: 4.h,
      ),
      padding: EdgeInsets.all(
        8.w,
      ),
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
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkGreyShade.withOpacity(0.2),
                  ),
                ),
                child: Icon(
                  Icons.local_mall_outlined,
                  size: 32.w,
                  color: AppColors.lightShade,
                ),
              ),
              if (showBadge)
                Positioned(
                  top: 4,
                  right: 8,
                  child: Container(
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
                  ),
                ),
            ],
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          inherit: true,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  notificationProvider.calculateTimeAgo(createdAt),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text('Order Tracking ID: $orderTrackingNumber'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
