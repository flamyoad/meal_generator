import 'package:meal_generator/core/api/drinks/models/drinks.dart';

import 'models/drinks_category_list.dart';

abstract class IDrinksApiProvider {
  Future<DrinksCategoryListJson> getAllCategories();
  Future <Drinks> getDrinkByCategory(String categoryName);
}