import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/current_order_tab.dart';
import 'widgets/order_history_tab.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.03,
          bottom: TabBar(
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.darkGreyShade,
            indicatorColor: AppColors.primaryColor,
            tabs: const [
              Tab(text: 'CURRENT ORDER'),
              Tab(text: 'ORDER HISTORY'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrentOrderTab(),
            OrderHistoryTab(),
          ],
        ),
      ),
    );
  }
}
