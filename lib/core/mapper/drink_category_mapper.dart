import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';

import 'mapper.dart';

class DrinksCategoryMapper extends Mapper<DrinksCategoryJson, DrinksCategory> {
  @override
  DrinksCategoryJson from(DrinksCategory? output) {
    throw UnimplementedError();
  }

  @override
  DrinksCategory to(DrinksCategoryJson? input) {
    return DrinksCategory(name: input?.name ?? "", isSelected: false);
  }
}
