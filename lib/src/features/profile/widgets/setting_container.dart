import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/global_imports.dart';

class SettingContainer extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Widget>? subSettings;

  const SettingContainer({
    super.key,
    required this.title,
    required this.icon,
    this.subSettings,
  });

  @override
  SettingContainerState createState() => SettingContainerState();
}

class SettingContainerState extends State<SettingContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Column(
      children: [
        ListTile(
          onTap: () {
            if (widget.subSettings != null) {
              setState(() {
                isExpanded = !isExpanded;
              });
            }
          },
          title: Row(
            children: [
              Icon(
                widget.icon,
                color: darkMode ? AppColors.lightShade : AppColors.darkShade,
                size: 28.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        inherit: true,
                      ),
                ),
              ),
              widget.subSettings != null
                  ? Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 22.w,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        if (isExpanded)
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Column(
              children: widget.subSettings!.map((subSetting) {
                return Column(
                  children: [
                    subSetting,
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
