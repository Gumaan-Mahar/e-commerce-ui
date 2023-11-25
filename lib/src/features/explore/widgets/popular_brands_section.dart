import 'package:e_commerce_ui/src/features/explore/explore_provider.dart';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_imports.dart';

class PopularBrandsSection extends StatelessWidget {
  const PopularBrandsSection({
    required this.exploreProvider,
    super.key,
  });

  final ExploreProvider exploreProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: exploreProvider.popularBrands
            .map(
              (brand) => SizedBox(
                width: 120.w,
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.darkGreyShade.withOpacity(
                            0.2,
                          ),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            brand.logoUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        brand.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
