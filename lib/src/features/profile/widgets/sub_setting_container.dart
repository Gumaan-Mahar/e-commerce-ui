import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class SubSettingContainer extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  const SubSettingContainer({
    required this.label,
    required this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return ListTile(
      title: Row(
        children: [
          Icon(
            prefixIcon,
            color: darkMode
                ? AppColors.lightShade
                : AppColors.darkShade.withOpacity(0.3),
            size: 28.w,
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    inherit: true,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
