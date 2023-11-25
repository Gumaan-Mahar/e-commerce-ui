import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class RatingsAndReviewsSection extends StatelessWidget {
  final int totalRatings;
  const RatingsAndReviewsSection({super.key, required this.totalRatings});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Ratings & Reviews',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color:
                        darkMode ? AppColors.lightShade : AppColors.darkShade,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  '($totalRatings)',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            String username = 'User $index';
            String timeAgo = '2 days ago';
            int rating = 4;
            String review =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$username - $timeAgo',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (starIndex) => Icon(
                            starIndex < rating ? Icons.star : Icons.star_border,
                            color: AppColors.primaryColor,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    review,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
