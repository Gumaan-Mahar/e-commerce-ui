import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class ProfileInfo extends StatelessWidget {
  final String title;
  final int value;

  const ProfileInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                inherit: true,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                inherit: true,
                color: darkMode ? AppColors.lightShade : AppColors.darkShade,
              ),
        ),
      ],
    );
  }
}
