import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/models/meals.dart';
import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';

abstract class IMealsRepository {
  Future<Either<Exception, List<MealsCategory>>> getAllCategories();
  Future<Either<Exception, Meals>> getMealByCategory();
}