import 'package:dartz/dartz.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/models/meals_list.dart';
import 'package:meal_generator/core/mapper/meal_category_mapper.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

class MealsRepository implements IMealsRepository {

  late IMealsApiProvider _mealsApi;
  late MealCategoryMapper _mapper;

  MealsRepository(this._mealsApi, this._mapper);

  @override
  Future<Either<Exception, List<UiMealsCategory>>> getAllCategories() async {
    try {
      var result = await _mealsApi.getAllCategories();
      var mappedResults = _mapper.toList(result.categories);
      return Right(mappedResults);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, List<Meals>>> getAllMealsByCategory(String categoryName) async {
    try {
      var result = await _mealsApi.getAllMealsByCategory(categoryName);
      return Right(result.list);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}