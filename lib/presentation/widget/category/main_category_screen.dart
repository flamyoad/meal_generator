import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/di/service_locator.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/widget/category/drinks_category_screen.dart';
import 'package:meal_generator/presentation/widget/category/meals_category_screen.dart';

class MainCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainCategoryBloc>(create: (context) => MainCategoryBloc()),
          BlocProvider<MealsCategoryBloc>(
              create: (context) =>
                  MealsCategoryBloc(sl.get<IMealsRepository>(), MealsCategoryLoading())),
          BlocProvider<DrinksCategoryBloc>(
              create: (context) =>
                  DrinksCategoryBloc(sl.get<IDrinkRepository>(), DrinksCategoryLoading()))
        ],
        child: Scaffold(
          body: CustomScrollView(
            shrinkWrap: true, // if set to false, exception will be thrown wh?y?
            slivers: [
              MealsCategoryScreen(),
              DrinksCategoryScreen(),
            ],
          ),
        ));
  }

  Widget _buildHeader() {
    return Card(
      color: Colors.black,
      child: Text('Please select your choice of food and drink',
          style: TextStyle(color: Colors.white)),
    );
  }
}
