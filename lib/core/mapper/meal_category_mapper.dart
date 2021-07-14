import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/mapper/mapper.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

class MealCategoryMapper extends Mapper<MealsCategory, UiMealsCategory> {
  @override
  MealsCategory from(UiMealsCategory? output) {
    throw UnimplementedError(); // Not used
  }

  @override
  UiMealsCategory to(MealsCategory? input) {
    return UiMealsCategory(id: input?.id ?? "-1",
        name: input?.name ?? "",
        thumbnailUrl: input?.thumbnailUrl ?? "",
        description: input?.description ?? "",
        isSelected: false);
  }

}