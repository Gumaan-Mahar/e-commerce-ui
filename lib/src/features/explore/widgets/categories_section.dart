import 'package:e_commerce_ui/src/features/explore/explore_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants.dart';
import '../../../core/global_imports.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  final ExploreProvider exploreProvider;
  const CategoriesSection({
    super.key,
    required this.exploreProvider,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = Constants.getScreenHeight(context);
    return SizedBox(
      height: screenHeight * 0.3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: exploreProvider.categories
                  .sublist(0, (exploreProvider.categories.length / 2).ceil())
                  .map(
                    (category) => CategoryCard(category: category),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: exploreProvider.categories
                  .sublist(exploreProvider.categories.length ~/ 2)
                  .map(
                    (category) => CategoryCard(category: category),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
