
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_generator/core/api/api_environment.dart';
import 'package:meal_generator/core/api/drinks/drinks_api_provider.dart';
import 'package:meal_generator/core/api/drinks/i_drinks_api_provider.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/meals_api_provider.dart';
import 'package:meal_generator/core/network/dio_network_client.dart';
import 'package:meal_generator/core/network/i_network_client.dart';
import 'package:meal_generator/core/repository/drinks/drinks_repository.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/core/repository/meals/meals_repository.dart';

final sl = GetIt.instance;

Future<void> registerServiceLocator(ApiEnvironment env) async {
  registerNetworkClient(env);
  registerApi();
  registerRepository();
}

void registerNetworkClient(ApiEnvironment env) {
  sl.registerLazySingleton<INetworkClient>(() {
    var client = DioNetworkClient(
        options: BaseOptions(baseUrl: env.mealsEndPoint));
    return client;
  }, instanceName: 'Meals');

  sl.registerLazySingleton<INetworkClient>(() {
    var client = DioNetworkClient(
        options: BaseOptions(baseUrl: env.drinksEndPoint));
    return client;
  }, instanceName: 'Drinks');
}

void registerApi() {
  sl.registerLazySingleton<IMealsApiProvider>(() {
    return MealsApiProvider(sl.get(instanceName: 'Meals'));
  });

  sl.registerLazySingleton<IDrinksApiProvider>(() {
    return DrinksApiProvider(sl.get(instanceName: 'Drinks'));
  });
}

void registerRepository() {
  sl.registerLazySingleton<IMealsRepository>(() {
    return MealsRepository(sl.get());
  });

  sl.registerLazySingleton<IDrinkRepository>(() {
    return DrinksRepository(sl.get());
  });
}