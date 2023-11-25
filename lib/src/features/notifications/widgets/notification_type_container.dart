import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class NotificationTypeContainer extends StatelessWidget {
  final IconData icon;
  final Color backgorundColor;
  final String label;
  final VoidCallback onPressed;
  const NotificationTypeContainer({
    super.key,
    required this.icon,
    required this.backgorundColor,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(
              12.w,
            ),
            decoration: BoxDecoration(
              color: backgorundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.darkGreyShade.withOpacity(
                  0.2,
                ),
              ),
            ),
            child: Icon(
              icon,
              size: 22.w,
              color: AppColors.lightShade,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  inherit: true,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
