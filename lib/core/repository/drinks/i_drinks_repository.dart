import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/drinks/models/drinks.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';

abstract class IDrinkRepository {
  Future<Either<Exception, List<DrinksCategory>>> getAllCategories();
  Future<Either<Exception, Drinks>> getDrinksByCategory();
}