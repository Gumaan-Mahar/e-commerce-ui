import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';
import 'icon_tab_widget.dart';

class PrimaryActions extends StatelessWidget {
  const PrimaryActions({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTab(icon: Icons.discount_outlined, label: 'Coupons'),
              IconTab(icon: Icons.people, label: 'Referrals'),
              IconTab(icon: Icons.card_giftcard, label: 'Gift'),
              IconTab(icon: Icons.attach_money, label: 'Donate'),
            ],
          ),
          SizedBox(height: 8.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTab(icon: Icons.track_changes, label: 'Track Order'),
              IconTab(icon: Icons.support_agent, label: 'Live Support'),
              IconTab(icon: Icons.videogame_asset, label: 'Play & Earn'),
              IconTab(icon: Icons.history, label: 'History'),
            ],
          ),
        ],
      ),
    );
  }
}
