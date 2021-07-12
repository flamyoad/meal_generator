import 'package:dio/dio.dart';

class DioClientOptions {

  static BaseOptions mealApi() {
    return BaseOptions(
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
  }

  static BaseOptions drinkApi() {
    return BaseOptions(
      baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
  }
}