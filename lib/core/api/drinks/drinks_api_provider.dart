import 'package:dio/dio.dart';
import 'package:meal_generator/core/api/drinks/i_drinks_api_provider.dart';
import 'package:meal_generator/core/api/drinks/models/drinks.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/core/network/i_network_client.dart';

class DrinksApiProvider implements IDrinksApiProvider {
  final INetworkClient client;

  DrinksApiProvider(this.client);

  @override
  String get baseUrl => 'https://www.thecocktaildb.com/api/json/v1/1/';

  @override
  Future<DrinksCategoryList> getAllCategories() async {
    try {
      var path = 'list.php?c=list';
      var res = await client.get(path);
      return DrinksCategoryList.fromJson(res.data);
    } on DioError catch (exception) {
      throw exception; // Rethrow the exception. todo: Handle the exception
    }
  }

  @override
  Future<Drinks> getDrinkByCategory(String categoryName) {
    // TODO: implement getDrinkByCategory
    throw UnimplementedError();
  }
}