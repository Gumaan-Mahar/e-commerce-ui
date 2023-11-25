import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class IconTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconTab({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.2),
          ),
          padding: EdgeInsets.all(12.0.w),
          child: Icon(
            icon,
            size: 22.w,
            color: primaryColor,
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 60.w,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  inherit: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
          ),
        ),
      ],
    );
  }
}
