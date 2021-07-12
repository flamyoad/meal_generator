import 'package:meal_generator/core/api/i_api_provider.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/models/meals.dart';
import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/network/i_network_client.dart';

class MealsApiProvider extends IApiProvider implements IMealsApiProvider {

  MealsApiProvider(INetworkClient client): super(client);

  @override
  Future<MealsCategoryList> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<Meals> getDrinkByCategory(String categoryName) {
    // TODO: implement getDrinkByCategory
    throw UnimplementedError();
  }

}