import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/models/meals.dart';
import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/mapper/meal_category_mapper.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealsRepository implements IMealsRepository {

  late IMealsApiProvider mealsApi;
  late MealCategoryMapper mapper;

  MealsRepository(this.mealsApi, this.mapper);

  @override
  Future<Either<Exception, List<MealsCategory>>> getAllCategories() async {
    try {
      var result = await mealsApi.getAllCategories();
      var mappedResults = mapper.toList(result.categories);
      return Right(mappedResults);
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