import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class ProductRatingsContainer extends StatelessWidget {
  final double productRating;
  final int totalRatings;
  final int peopleRated;
  final int timesSold;
  final int timesAddedToWishlist;

  const ProductRatingsContainer({
    Key? key,
    required this.productRating,
    required this.totalRatings,
    required this.peopleRated,
    required this.timesSold,
    required this.timesAddedToWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                  size: 20.w,
                ),
                Text(
                  '$productRating / 5.0',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  '($peopleRated)',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12.w,
              color: Colors.grey,
            ),
            SizedBox(
              width: 8.w,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$timesSold',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'Sold',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.favorite_border,
              size: 18.w,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '$timesAddedToWishlist',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
