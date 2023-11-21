import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/features/cart/cart_screen.dart';
import 'package:e_commerce_ui/src/themes/themes.dart';

import 'src/core/app_data_provider.dart';
import 'src/core/global_imports.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/features/cart/cart_provider.dart';
import 'src/features/explore/explore_provider.dart';
import 'src/features/explore/explore_screen.dart';
import 'src/features/home/home_provider.dart';
import 'src/features/home/home_screen.dart';
import 'src/features/notifications/notifications_provider.dart';
import 'src/features/product_detail/product_detail_provider.dart';
import 'src/features/profile/profile_screen.dart';
import 'src/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExploreProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductDetailProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = Constants.getScreenWidth(context);
    double screenHeight = Constants.getScreenHeight(context);

    return ScreenUtilInit(
      designSize: Size(
        screenWidth,
        screenHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: Provider.of<AppDataProvider>(context).themeMode,
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppDataProvider>(
        builder: (context, appData, child) {
          return IndexedStack(
            index: appData.currentIndex,
            children: const [
              HomeScreen(),
              ExploreScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWrapper(),
    );
  }
}
