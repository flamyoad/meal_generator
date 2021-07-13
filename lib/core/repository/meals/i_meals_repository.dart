import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/models/meals.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

abstract class IMealsRepository {
  Future<Either<Exception, List<MealsCategory>>> getAllCategories();
  Future<Either<Exception, Meals>> getMealByCategory();
}