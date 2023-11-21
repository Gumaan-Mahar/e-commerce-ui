import 'package:e_commerce_ui/src/core/constants.dart';
import 'package:e_commerce_ui/src/core/global_imports.dart';

import '../../models/brand.dart';
import '../../models/category.dart';

class ExploreProvider extends ChangeNotifier {
  final List<Category> categories = Constants.categories;
  final List<Brand> popularBrands = Constants.popularBrands;
}
