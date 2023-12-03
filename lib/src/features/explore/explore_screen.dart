import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/features/explore/explore_provider.dart';
import 'package:e_commerce_ui/src/features/explore/widgets/explore_more_section.dart';
import 'package:e_commerce_ui/src/features/explore/widgets/search_bar_widget.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widgets/categories_section.dart';
import 'widgets/popular_brands_section.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.h,
        ),
        child: const SearchAppBar(),
      ),
      body: Consumer<ExploreProvider>(
        builder: (context, exploreProvider, child) {
          final double screenHeight = Constants.getScreenHeight(context);
          final darkMode =
              Theme.of(context).brightness == Brightness.dark ? true : false;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color:
                          darkMode ? AppColors.darkShade : AppColors.lightShade,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search By Image',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    inherit: true,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Find similiar products by an image',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    inherit: true,
                                    color: AppColors.darkGreyShade,
                                  ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color:
                                      AppColors.darkGreyShade.withOpacity(0.2),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.darkGreyShade,
                              ),
                              label: Text(
                                'Capture a Photo',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      inherit: true,
                                      color: AppColors.darkGreyShade,
                                    ),
                              ),
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color:
                                      AppColors.darkGreyShade.withOpacity(0.2),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.photo_outlined,
                                color: AppColors.darkGreyShade,
                              ),
                              label: Text(
                                'Upload an Image',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      inherit: true,
                                      color: AppColors.darkGreyShade,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: screenHeight * 0.38,
                    decoration: BoxDecoration(
                      color:
                          darkMode ? AppColors.darkShade : AppColors.lightShade,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            top: 8.h,
                          ),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CategoriesSection(
                          exploreProvider: exploreProvider,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: screenHeight * 0.26,
                    decoration: BoxDecoration(
                      color:
                          darkMode ? AppColors.darkShade : AppColors.lightShade,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            top: 8.h,
                            bottom: 4.h,
                          ),
                          child: Text(
                            "Popular Brands",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        PopularBrandsSection(
                          exploreProvider: exploreProvider,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const ExploreMoreSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
