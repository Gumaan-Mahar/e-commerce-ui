import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../themes/app_colors.dart';
import '../notifications_provider.dart';

class ChatNotificationContainer extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final DateTime createdAt;
  final String userAvatar;

  const ChatNotificationContainer({
    Key? key,
    required this.userName,
    required this.lastMessage,
    required this.createdAt,
    required this.userAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationsProvider>(context);
    final darkMode =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Container(
      margin: EdgeInsets.only(
        bottom: 4.h,
      ),
      padding: EdgeInsets.all(
        8.w,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkShade : AppColors.lightShade,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.w,
            backgroundImage: AssetImage(
              userAvatar,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        inherit: true,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  lastMessage,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        inherit: true,
                        color: AppColors.darkGreyShade.withOpacity(
                          0.8,
                        ),
                      ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                notificationProvider.calculateTimeAgo(createdAt),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      inherit: true,
                      color: AppColors.darkGreyShade.withOpacity(
                        0.8,
                      ),
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    20.w,
                  ),
                ),
                child: Text(
                  'New',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        inherit: true,
                        color: AppColors.lightShade,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
