import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';

import 'models/meals.dart';

abstract class IMealsApiProvider {
  Future<MealsCategoryList> getAllCategories();
  Future <Meals> getDrinkByCategory(String categoryName);
}