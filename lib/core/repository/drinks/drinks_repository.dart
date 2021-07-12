import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/drinks/i_drinks_api_provider.dart';
import 'package:meal_generator/core/api/drinks/models/drinks.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';

class DrinksRepository implements IDrinkRepository {

  late IDrinksApiProvider drinksApi;

  DrinksRepository(this.drinksApi);

  @override
  Future<Either<Exception, List<DrinksCategory>>> getAllCategories() async {
    try {
      var drinksCategories = await drinksApi.getAllCategories();
      return Right(drinksCategories.categories);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, Drinks>> getDrinksByCategory() {
    throw UnimplementedError();
  }
}