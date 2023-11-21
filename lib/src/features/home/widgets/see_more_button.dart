import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SeeMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,),
          borderRadius: BorderRadius.circular(8.w,),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "See More",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blue,
                // fontWeight: FontWeight.bold,
              ),
            ),
             Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.blue,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
