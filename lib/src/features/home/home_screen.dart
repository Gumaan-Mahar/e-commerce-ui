import 'package:e_commerce_ui/src/features/home/home_provider.dart';
import 'package:e_commerce_ui/src/features/home/widgets/banner_images_widget.dart';
import 'package:e_commerce_ui/src/features/home/widgets/notifications_badge.dart';
import 'package:e_commerce_ui/src/features/home/widgets/deals_list_tile.dart';
import 'package:e_commerce_ui/src/features/home/widgets/primary_actions.dart';
import 'package:e_commerce_ui/src/features/home/widgets/products_list_tile.dart';
import 'package:e_commerce_ui/src/features/notifications/notifications_screen.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widgets/deal_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: Text(
          "GM.",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontFamily: 'Pacifico',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code_scanner,
              size: 30.w,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.w,
              ),
              child: const Center(
                child: NotificationsBadgeWidget(
                  numberOfNotifications: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                BannerImagesWidget(homeProvider: homeProvider),
                const PrimaryActions(),
                SizedBox(
                  height: 4.h,
                ),
                const DealsListTile(
                  dealTitle: 'Personalised Deals',
                  dealDescription: 'Unique deals designed with you in mind',
                  deals: [
                    DealCard(
                      dealName: "Birthday Surprise Offer",
                      discount: 45,
                      countdownHours: 16,
                      title:
                          "Happy Birthday, Shopper! Enjoy Personalized Discounts",
                      images: [
                        'assets/images/banners/banner_3.jpg',
                        'assets/images/banners/banner_4.jpg',
                        'assets/images/banners/banner_2.jpg',
                        'assets/images/banners/banner_5.jpg',
                      ],
                    ),
                    DealCard(
                      dealName: "Anniversary Celebration Deal",
                      discount: 30,
                      countdownHours: 24,
                      title:
                          "Anniversary Special: Save Big on Your Special Day!",
                      images: [
                        'assets/images/banners/banner_5.jpg',
                        'assets/images/banners/banner_4.jpg',
                        'assets/images/banners/banner_3.jpg',
                        'assets/images/banners/banner_2.jpg',
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                ProductsListTile(
                  title: 'Trending Now',
                  description: 'Get \'em before they\'re gone',
                  products: homeProvider.products,
                ),
                ProductsListTile(
                  title: 'Community\'s Top Picks',
                  description: 'See what your neighbours are interested in',
                  products: homeProvider.products,
                ),
                const DealsListTile(
                  dealTitle: 'Exclusive Discounts',
                  dealDescription:
                      'Special discounts for special celebrations.',
                  deals: [
                    DealCard(
                      dealName: "Black Friday Savings",
                      discount: 60,
                      countdownHours: 18,
                      title: "Unlock irresistible Black Friday discounts",
                      images: [
                        'assets/images/banners/banner_2.jpg',
                        'assets/images/banners/banner_5.jpg',
                        'assets/images/banners/banner_4.jpg',
                        'assets/images/banners/banner_3.jpg',
                      ],
                    ),
                    DealCard(
                      dealName: "Valentine's Special Discount",
                      discount: 40,
                      countdownHours: 20,
                      title:
                          "Share the love with exclusive Valentine's Day discounts",
                      images: [
                        'assets/images/banners/banner_4.jpg',
                        'assets/images/banners/banner_5.jpg',
                        'assets/images/banners/banner_2.jpg',
                        'assets/images/banners/banner_3.jpg',
                      ],
                    ),
                    DealCard(
                      dealName: "Thanksgiving Gratitude Deal",
                      discount: 55,
                      countdownHours: 10,
                      title:
                          "Express gratitude with our Thanksgiving Gratitude Deal",
                      images: [
                        'assets/images/banners/banner_2.jpg',
                        'assets/images/banners/banner_5.jpg',
                        'assets/images/banners/banner_3.jpg',
                        'assets/images/banners/banner_4.jpg',
                      ],
                    ),
                  ],
                ),
                ProductsListTile(
                  title: 'Free Delivery',
                  description:
                      'Get your orders delivered to your doorstep at no extra cost',
                  products: homeProvider.products,
                ),
                ProductsListTile(
                  title: 'Celebrity Endorsments',
                  description: 'Products used by celebrities',
                  products: homeProvider.products,
                ),
                ProductsListTile(
                  title: 'Fresh & Relevant',
                  description: 'New Arrivals You Might Be Interested In',
                  products: homeProvider.products,
                ),
                ProductsListTile(
                  title: 'Recently Viewed',
                  description: 'Products you have viewed in last 7 days',
                  products: homeProvider.products,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
