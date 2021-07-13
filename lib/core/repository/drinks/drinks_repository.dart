import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/drinks/i_drinks_api_provider.dart';
import 'package:meal_generator/core/api/drinks/models/drinks.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/core/mapper/drink_category_mapper.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';

class DrinksRepository implements IDrinkRepository {

  late IDrinksApiProvider drinksApi;
  late DrinksCategoryMapper mapper;

  DrinksRepository(this.drinksApi, this.mapper);

  @override
  Future<Either<Exception, List<DrinksCategory>>> getAllCategories() async {
    try {
      var result = await drinksApi.getAllCategories();
      var mappedResult = mapper.toList(result.categories);
      return Right(mappedResult);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, Drinks>> getDrinksByCategory() {
    throw UnimplementedError();
  }
}