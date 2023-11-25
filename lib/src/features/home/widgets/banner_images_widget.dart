import 'package:e_commerce_ui/src/features/home/home_provider.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class BannerImagesWidget extends StatelessWidget {
  final HomeProvider homeProvider;
  const BannerImagesWidget({
    super.key,
    required this.homeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      color: darkMode ? AppColors.darkShade : AppColors.lightShade,
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 120.h,
            child: PageView.builder(
              controller: homeProvider.pageController,
              onPageChanged: (index) {
                homeProvider.changeBanner(index);
              },
              itemCount: homeProvider.bannerImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    image: DecorationImage(
                      image: AssetImage(homeProvider.bannerImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: homeProvider.bannerImages.map((image) {
              int index = homeProvider.bannerImages.indexOf(image);
              return Container(
                width: homeProvider.currentBannerIndex == index ? 16.w : 6.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: homeProvider.currentBannerIndex == index
                      ? BorderRadius.circular(
                          4.0,
                        )
                      : null,
                  shape: homeProvider.currentBannerIndex == index
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: homeProvider.currentBannerIndex == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
