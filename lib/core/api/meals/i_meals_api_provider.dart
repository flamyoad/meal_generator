import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';

import 'models/meals_list.dart';

abstract class IMealsApiProvider {
  Future<MealsCategoryList> getAllCategories();
  Future <MealsList> getAllMealsByCategory(String categoryName);
}