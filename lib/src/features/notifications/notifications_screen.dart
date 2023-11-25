import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/chat_notification_container.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/chat_notifications_screen.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/order_notification_container.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/order_notifications_screen.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/personalized_notifications_screen.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/promos_notifications_screen.dart';
import 'package:e_commerce_ui/src/features/notifications/widgets/promotion_notification_container.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/global_imports.dart';
import 'widgets/notification_type_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.getScreenWidth(context);
    final screenHeight = Constants.getScreenHeight(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 38.w,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
              size: 22.w,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.mark_email_read_outlined,
              color: AppColors.darkGreyShade,
              size: 20.w,
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Text(
              'Mark all as read',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    inherit: true,
                    color: AppColors.darkGreyShade,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            screenWidth,
            screenHeight * 0.1,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NotificationTypeContainer(
                    icon: Icons.question_answer_rounded,
                    backgorundColor: Colors.green,
                    label: 'Chats',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatsNotificationsScreen(),
                      ),
                    ),
                  ),
                  NotificationTypeContainer(
                    icon: Icons.local_mall_outlined,
                    backgorundColor: Colors.blue,
                    label: 'Order',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderNotificationsScreen(),
                      ),
                    ),
                  ),
                  NotificationTypeContainer(
                    icon: Icons.notifications_active_outlined,
                    backgorundColor: Colors.yellow,
                    label: 'Notifications',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PersonalizedNotificationsScreen(),
                      ),
                    ),
                  ),
                  NotificationTypeContainer(
                    icon: Icons.local_attraction_outlined,
                    backgorundColor: Colors.orange,
                    label: 'Promos',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PromosNotificationsScreen(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            PromotionNotificationContainer(
              title: '50% Off on Electronics',
              createdAt: DateTime.now().subtract(
                const Duration(
                  seconds: 50,
                ),
              ),
              image: 'assets/images/banners/banner_3.jpg',
              message:
                  'Explore our latest electronics collection. Limited time offer!',
              showBadge: true,
            ),
            PromotionNotificationContainer(
              title: 'Flash Sale - Fashion Items',
              createdAt: DateTime.now().subtract(
                const Duration(
                  hours: 3,
                ),
              ),
              image: 'assets/images/banners/banner_5.jpg',
              message:
                  'Hurry up! Grab your favorite fashion items at unbeatable prices.',
            ),
            ChatNotificationContainer(
              userName: 'Gumaan Mahar',
              lastMessage: 'Sorry, your offer is too low',
              createdAt: DateTime.now().subtract(
                const Duration(
                  hours: 3,
                ),
              ),
              userAvatar: 'assets/images/product_images/product_20.jpg',
            ),
            PromotionNotificationContainer(
              title: 'Exclusive Deals for VIP Members',
              createdAt: DateTime.now().subtract(
                const Duration(
                  days: 5,
                ),
              ),
              image: 'assets/images/banners/banner_4.jpg',
              message:
                  'As a VIP member, enjoy exclusive discounts and early access to new arrivals.',
            ),
            OrderNotificationContainer(
              title:
                  'Your order has been shipped, and will be delievered to you in 3 business days.',
              createdAt: DateTime.now().subtract(
                const Duration(
                  hours: 3,
                ),
              ),
              orderTrackingNumber: '223928339110485',
              showBadge: true,
            ),
          ],
        ),
      ),
    );
  }
}
