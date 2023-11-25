import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../core/global_imports.dart';

class DarkModeToggle extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const DarkModeToggle(
      {super.key, required this.isDarkMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    final screenWidth = Constants.getScreenWidth(context);
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.brightness_4_outlined,
                color: darkMode ? AppColors.lightShade : AppColors.darkShade,
                size: 28.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      inherit: true,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              onToggle(!isDarkMode);
            },
            child: Container(
              width: screenWidth * 0.13,
              height: screenHeight * 0.036,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isDarkMode ? Colors.blue : Colors.grey.shade400,
              ),
              child: Row(
                mainAxisAlignment: isDarkMode
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkMode
                          ? AppColors.lightShade
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
