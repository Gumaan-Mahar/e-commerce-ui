import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';
import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class StoreDetailsContainer extends StatelessWidget {
  final String storeName;
  final String storeImage;
  final int followersCount;
  final double positiveRatings;
  final double onTimeShipment;
  final double chatResponseRate;

  const StoreDetailsContainer({
    Key? key,
    required this.storeName,
    required this.storeImage,
    required this.followersCount,
    required this.positiveRatings,
    required this.onTimeShipment,
    required this.chatResponseRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    storeImage,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.w,
                        ),
                        color: darkMode
                            ? AppColors.darkGreyShade.withOpacity(
                                0.8,
                              )
                            : AppColors.darkGreyShade.withOpacity(
                                0.2,
                              ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            followersCount.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPercentageWidget(
                  'Positive Seller Ratings', positiveRatings),
              _buildPercentageWidget('On Time Shipment Rate', onTimeShipment),
              _buildPercentageWidget('Chat Response Rate', chatResponseRate),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add),
                label: const Text('Follow'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.storefront),
                label: const Text('Visit Store'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageWidget(String title, double percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${percentage.toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          width: 100.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
