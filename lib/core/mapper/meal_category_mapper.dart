import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/mapper/mapper.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealCategoryMapper extends Mapper<MealsCategoryJson, MealsCategory> {
  @override
  MealsCategoryJson from(MealsCategory? output) {
    throw UnimplementedError(); // Not used
  }

  @override
  MealsCategory to(MealsCategoryJson? input) {
    return MealsCategory(id: input?.id ?? "-1",
        name: input?.name ?? "",
        thumbnailUrl: input?.thumbnailUrl ?? "",
        description: input?.description ?? "",
        isSelected: false);
  }

}