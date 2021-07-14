import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_list.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';

abstract class IDrinksRepository {
  Future<Either<Exception, List<UiDrinksCategory>>> getAllCategories();
  Future<Either<Exception, List<Drinks>>> getAllDrinksByCategory(String categoryName);
}