import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class QAndASection extends StatelessWidget {
  const QAndASection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Q&A',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: darkMode ? AppColors.lightShade : AppColors.darkShade,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            String question = 'Is this product available in different colors?';
            String answer = 'Yes, it is available in multiple colors.';

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.question_answer,
                        color: darkMode
                            ? AppColors.lightShade
                            : AppColors.darkShade,
                        size: 20.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          question,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: darkMode
                                ? AppColors.lightShade
                                : AppColors.darkShade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.question_answer,
                        color: Colors.grey,
                        size: 20.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          answer,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              side: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            child: const Text('Ask a Question'),
          ),
        ),
      ],
    );
  }
}
