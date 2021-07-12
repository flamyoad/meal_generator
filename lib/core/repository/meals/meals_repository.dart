import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/models/meals.dart';
import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';

class MealsRepository implements IMealsRepository {

  late IMealsApiProvider mealsApi;

  MealsRepository(this.mealsApi);

  @override
  Future<Either<Exception, List<MealsCategory>>> getAllCategories() async {
    try {
      var mealsCategories = await mealsApi.getAllCategories();
      return Right(mealsCategories.categories);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, Meals>> getMealByCategory() {
    // TODO: implement getMealByCategory
    throw UnimplementedError();
  }
}