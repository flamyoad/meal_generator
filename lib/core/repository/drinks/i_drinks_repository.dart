import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/drinks/models/drinks.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';

abstract class IDrinkRepository {
  Future<Either<Exception, List<DrinksCategory>>> getAllCategories();
  Future<Either<Exception, Drinks>> getDrinksByCategory();
}