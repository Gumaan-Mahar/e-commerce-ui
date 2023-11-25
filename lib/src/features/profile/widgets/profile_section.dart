import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';
import 'profile_info.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 40.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.w,
                    backgroundImage: const AssetImage(
                      'assets/images/product_images/product_4.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gumaan Mahar',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  inherit: true,
                                  fontWeight: FontWeight.w500,
                                  color: darkMode
                                      ? AppColors.lightShade
                                      : AppColors.darkShade,
                                ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.w,
                          ),
                          border: Border.all(
                            color: darkMode
                                ? AppColors.darkGreyShade.withOpacity(
                                    0.8,
                                  )
                                : AppColors.darkGreyShade.withOpacity(
                                    0.3,
                                  ),
                          ),
                        ),
                        child: Text(
                          'Add phone number',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    inherit: true,
                                    color: AppColors.primaryColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(
                  8.w,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkMode
                      ? AppColors.darkGreyShade.withOpacity(
                          0.2,
                        )
                      : AppColors.darkGreyShade.withOpacity(
                          0.1,
                        ),
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.blue,
                  size: 22.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileInfo(
                title: 'My Wishlist',
                value: 11,
              ),
              ProfileInfo(
                title: 'Followed Stores',
                value: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
