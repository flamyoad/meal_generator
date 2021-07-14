import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';

import 'mapper.dart';

class DrinksCategoryMapper extends Mapper<DrinksCategory, UiDrinksCategory> {
  @override
  DrinksCategory from(UiDrinksCategory? output) {
    throw UnimplementedError();
  }

  @override
  UiDrinksCategory to(DrinksCategory? input) {
    return UiDrinksCategory(name: input?.name ?? "", isSelected: false);
  }
}
