import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_generator/core/api/environment.dart';
import 'package:meal_generator/core/api/drinks/drinks_api_provider.dart';
import 'package:meal_generator/core/api/drinks/i_drinks_api_provider.dart';
import 'package:meal_generator/core/api/meals/i_meals_api_provider.dart';
import 'package:meal_generator/core/api/meals/meals_api_provider.dart';
import 'package:meal_generator/core/mapper/drink_category_mapper.dart';
import 'package:meal_generator/core/mapper/meal_category_mapper.dart';
import 'package:meal_generator/core/network/dio_network_client.dart';
import 'package:meal_generator/core/network/i_network_client.dart';
import 'package:meal_generator/core/persistence/hive_storage.dart';
import 'package:meal_generator/core/persistence/i_local_storage.dart';
import 'package:meal_generator/core/repository/drinks/drinks_repository.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/core/repository/meals/meals_repository.dart';
import 'package:meal_generator/core/repository/settings_repository.dart';

final sl = GetIt.instance;

Future<void> registerServiceLocator(Environment env) async {
  registerNetworkClients(env);
  registerApis();
  registerRepositories();
  registerMappers();
  registerLocalStorages(env);
}

void registerNetworkClients(Environment env) {
  sl.registerLazySingleton<INetworkClient>(() {
    var client = DioNetworkClient(options: BaseOptions(baseUrl: env.mealsEndPoint));
    return client;
  }, instanceName: 'Meals');

  sl.registerLazySingleton<INetworkClient>(() {
    var client = DioNetworkClient(options: BaseOptions(baseUrl: env.drinksEndPoint));
    return client;
  }, instanceName: 'Drinks');
}

void registerApis() {
  sl.registerLazySingleton<IMealsApiProvider>(() {
    return MealsApiProvider(sl.get(instanceName: 'Meals'));
  });

  sl.registerLazySingleton<IDrinksApiProvider>(() {
    return DrinksApiProvider(sl.get(instanceName: 'Drinks'));
  });
}

void registerRepositories() {
  sl.registerLazySingleton<IMealsRepository>(() {
    return MealsRepository(sl.get(), sl.get());
  });

  sl.registerLazySingleton<IDrinksRepository>(() {
    return DrinksRepository(sl.get(), sl.get());
  });

  sl.registerLazySingleton<SettingsRepository>(() {
    return SettingsRepository(sl.get(instanceName: 'HiveStorage'));
  });
}

void registerMappers() {
  sl.registerLazySingleton<MealCategoryMapper>(() => MealCategoryMapper());
  sl.registerLazySingleton<DrinksCategoryMapper>(() => DrinksCategoryMapper());
}

void registerLocalStorages(Environment env) {
  sl.registerSingletonAsync<ILocalStorage>(() async {
    final hiveStorage = HiveStorage();
    await hiveStorage.init(env.dbName);
    return hiveStorage;
  }, instanceName: 'HiveStorage', signalsReady: false);
}
