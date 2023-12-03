import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/app_data_provider.dart';
import '../core/global_imports.dart';

class BottomNavigationBarWrapper extends StatelessWidget {
  const BottomNavigationBarWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppDataProvider>(
      builder: (context, appData, child) {
        final darkMode =
            Theme.of(context).brightness == Brightness.dark ? true : false;
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color:
                    darkMode ? const Color(0xFF333333) : Colors.grey.shade200,
                width: 1.0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: appData.currentIndex,
            type: BottomNavigationBarType.shifting,
            selectedIconTheme: IconThemeData(
              size: 30.sp,
            ),
            unselectedIconTheme: IconThemeData(
              size: 30.sp,
            ),
            selectedFontSize: 14.sp,
            unselectedFontSize: 14.sp,
            onTap: (index) {
              context.read<AppDataProvider>().changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: darkMode
                    ? AppColors.navBarColorDark
                    : AppColors.navBarColorLight,
                icon: const Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: darkMode
                    ? AppColors.navBarColorDark
                    : AppColors.navBarColorLight,
                icon: const Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                backgroundColor: darkMode
                    ? AppColors.navBarColorDark
                    : AppColors.navBarColorLight,
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(Icons.shopping_cart_rounded),
                    Positioned(
                      top: -3.h,
                      child: Container(
                        padding: EdgeInsets.all(
                          4.w,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(
                            color: darkMode
                                ? AppColors.darkShade
                                : AppColors.lightShade,
                          ),
                        ),
                        child: Text(
                          3.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                backgroundColor: darkMode
                    ? AppColors.navBarColorDark
                    : AppColors.navBarColorLight,
                icon: const Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
