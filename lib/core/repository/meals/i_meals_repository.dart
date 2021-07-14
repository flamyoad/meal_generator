import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/models/meals_list.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

abstract class IMealsRepository {
  Future<Either<Exception, List<UiMealsCategory>>> getAllCategories();
  Future<Either<Exception, List<Meals>>> getAllMealsByCategory(String categoryName);
}