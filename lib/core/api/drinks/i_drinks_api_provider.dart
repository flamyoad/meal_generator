import 'package:meal_generator/core/api/drinks/models/drinks_list.dart';

import 'models/drinks_category_list.dart';

abstract class IDrinksApiProvider {
  Future<DrinksCategoryList> getAllCategories();
  Future <DrinksList> getAllDrinksByCategory(String categoryName);
}