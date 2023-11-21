import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/global_imports.dart';

class NotificationsBadgeWidget extends StatelessWidget {
  final int numberOfNotifications;
  const NotificationsBadgeWidget({
    super.key,
    required this.numberOfNotifications,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(
          Icons.notifications,
          size: 36.w,
          color: AppColors.primaryColor,
        ),
        Container(
          padding: EdgeInsets.all(
            3.w,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            border: Border.all(
              color: darkMode ? AppColors.darkShade : AppColors.lightShade,
            ),
          ),
          child: Text(
            numberOfNotifications.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp,
            ),
          ),
        ),
      ],
    );
  }
}
