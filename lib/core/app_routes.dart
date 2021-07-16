import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_cubit.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/bloc/lunch/drinks_cubit.dart';
import 'package:meal_generator/presentation/bloc/lunch/meals_cubit.dart';
import 'package:meal_generator/presentation/widget/category/main_category_screen.dart';
import 'package:meal_generator/presentation/widget/lunch/lunch_screen.dart';
import 'app_path.dart' as app_path;
import 'di/service_locator.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings, BuildContext context) {
    switch (routeSettings.name) {
      case app_path.category:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<MealsCategoryBloc>(
                      create: (context) => MealsCategoryBloc(sl.get<IMealsRepository>())),
                  BlocProvider<DrinksCategoryBloc>(
                      create: (context) => DrinksCategoryBloc(sl.get<IDrinksRepository>())),
                  BlocProvider<MainCategoryCubit>(
                      create: (context) => MainCategoryCubit(
                          mealsCategoryBloc: BlocProvider.of<MealsCategoryBloc>(context),
                          drinksCategoryBloc: BlocProvider.of<DrinksCategoryBloc>(context))),
                ], child: MainCategoryScreen()));

      case app_path.lunch:
        var tuple = routeSettings.arguments as Tuple2<String, String>;
        var mealsCategoryName = tuple.value1;
        var drinksCategoryName = tuple.value2;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) =>
                    MealsCubit(sl.get<IMealsRepository>(), mealsCategoryName)),
            BlocProvider(
                create: (context) =>
                    DrinksCubit(sl.get<IDrinksRepository>(), drinksCategoryName))
          ], child: LunchScreen()),
        );

      default:
        return MaterialPageRoute<Scaffold>(builder: (context) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${routeSettings.name}')),
          );
        });
    }
  }
}
