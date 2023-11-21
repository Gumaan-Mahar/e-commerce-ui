import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/app_data_provider.dart';


class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.getScreenWidth(context);
    final screenHeight = Constants.getScreenHeight(context);
    final bool darkMode =
        Provider.of<AppDataProvider>(context).themeMode == ThemeMode.dark;
    return AppBar(
      backgroundColor: darkMode ? AppColors.darkShade : AppColors.lightShade,
      title: Row(
        children: [
          Container(
            height: screenHeight * 0.065,
            decoration: BoxDecoration(
              color: darkMode ? AppColors.darkShade : AppColors.lightShade,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: AppColors.darkGreyShade,
                  ),
                  onPressed: () {},
                ),
                Center(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: screenWidth * 0.67,
                    child: TextField(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            inherit: true,
                          ),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: "Search by product, brand and more...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12.sp,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (query) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Icon(
            Icons.filter_list,
            color: AppColors.darkGreyShade,
          ),
        ],
      ),
    );
  }
}
