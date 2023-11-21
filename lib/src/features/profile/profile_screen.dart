import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/app_data_provider.dart';
import '../../core/global_imports.dart';
import 'widgets/dark_mode_toggle.dart';
import 'widgets/profile_section.dart';
import 'widgets/setting_container.dart';
import 'widgets/sub_setting_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppDataProvider>(context);
    final darkMode = appDataProvider.themeMode == ThemeMode.dark ? true : false;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ProfileSection(),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: darkMode ? AppColors.darkShade : AppColors.lightShade,
                  borderRadius: BorderRadius.circular(
                    8.w,
                  ),
                ),
                child: Column(
                  children: [
                    const SettingContainer(
                      title: 'Shopping Preferences',
                      icon: Icons.shopping_bag_outlined,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Delivery Address Management',
                          prefixIcon: Icons.pin_drop_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Payment Methods',
                          prefixIcon: Icons.payment_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Payment Security (CVV settings, PIN)',
                          prefixIcon: Icons.pin,
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    SettingContainer(
                      title: 'App Appearance Settings',
                      icon: Icons.app_settings_alt_outlined,
                      subSettings: [
                        DarkModeToggle(
                          isDarkMode:
                              appDataProvider.themeMode == ThemeMode.dark,
                          onToggle: (isDarkMode) {
                            appDataProvider.toggleTheme(
                              isDarkMode ? ThemeMode.dark : ThemeMode.light,
                            );
                          },
                        ),
                        const SubSettingContainer(
                          label: 'App Language',
                          prefixIcon: Icons.translate_outlined,
                        ),
                        const SubSettingContainer(
                          label: 'Currency Preferences',
                          prefixIcon: Icons.currency_exchange_outlined,
                        ),
                        const SubSettingContainer(
                          label: 'Accessibility Features',
                          prefixIcon: Icons.app_blocking_outlined,
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                      title: 'Notifications Settings',
                      icon: Icons.edit_notifications_outlined,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Push Notifications',
                          prefixIcon: Icons.notifications_active_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Email Notifications',
                          prefixIcon: Icons.email_outlined,
                        ),
                        SubSettingContainer(
                          label: 'SMS Notifications',
                          prefixIcon: Icons.message_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Notifications Preference',
                          prefixIcon: Icons.notifications_off_outlined,
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                      title: 'Privacy & Security Settings',
                      icon: Icons.security_outlined,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Privacy Controls',
                          prefixIcon: Icons.shield_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Two-Factor Authentication',
                          prefixIcon: Icons.lock_outline,
                        ),
                        SubSettingContainer(
                          label: 'Data Sharing Preferences',
                          prefixIcon: Icons.perm_data_setting_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: darkMode ? AppColors.darkShade : AppColors.lightShade,
                  borderRadius: BorderRadius.circular(
                    8.w,
                  ),
                ),
                child: Column(
                  children: [
                    const SettingContainer(
                      title: 'Help & Support',
                      icon: Icons.handshake_outlined,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Customer Support',
                          prefixIcon: Icons.support_agent_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Feedback & Contact',
                          prefixIcon: Icons.feedback_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Help Center',
                          prefixIcon: Icons.help_center_outlined,
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                      title: 'About',
                      icon: Icons.info_outline,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Terms & Conditions',
                          prefixIcon: Icons.notes_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Privacy Policy',
                          prefixIcon: Icons.privacy_tip_outlined,
                        ),
                        SubSettingContainer(
                          label: 'Cookies Policy',
                          prefixIcon: Icons.policy_outlined,
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                        title: 'Frequently Asked Questions',
                        icon: Icons.question_answer_outlined),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                      title: 'Rate Our App',
                      icon: Icons.star_border_outlined,
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    const SettingContainer(
                      title: 'More Settings',
                      icon: Icons.settings,
                      subSettings: [
                        SubSettingContainer(
                          label: 'Developer Options (for testing)',
                          prefixIcon: Icons.developer_mode_outlined,
                        ),
                        SubSettingContainer(
                          label: 'App Updates & Version',
                          prefixIcon: Icons.update,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: darkMode ? AppColors.darkShade : AppColors.lightShade,
                  borderRadius: BorderRadius.circular(
                    8.w,
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: 28.w,
                  ),
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          inherit: true,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
