import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/api/environment.dart';
import 'package:meal_generator/core/app_routes.dart';
import 'package:meal_generator/core/di/service_locator.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/widget/category/main_category_screen.dart';

import 'core/repository/drinks/i_drinks_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registerServiceLocator(DevEnvironment());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings routeSettings) {
          return AppRoutes.generateRoute(routeSettings, context);
        },
        home: MultiBlocProvider(providers: [
          BlocProvider<MealsCategoryBloc>(
              create: (context) =>
                  MealsCategoryBloc(sl.get<IMealsRepository>(), MealsCategoryLoading())),
          BlocProvider<DrinksCategoryBloc>(
              create: (context) =>
                  DrinksCategoryBloc(sl.get<IDrinkRepository>(), DrinksCategoryLoading())),
          BlocProvider<MainCategoryBloc>(
              create: (context) => MainCategoryBloc(
                  mealsCategoryBloc: BlocProvider.of<MealsCategoryBloc>(context),
                  drinksCategoryBloc: BlocProvider.of<DrinksCategoryBloc>(context))),
        ], child: MainCategoryScreen()));
  }
}
