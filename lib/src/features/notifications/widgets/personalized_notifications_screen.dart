import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';
import '../../../themes/app_colors.dart';

class PersonalizedNotificationsScreen extends StatelessWidget {
  const PersonalizedNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalized Notifications'),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active_outlined,
              size: 100.w,
              color: Colors.grey,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'No Personalized Notifications',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Personalize Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
