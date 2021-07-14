import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/widget/category/main_category_screen.dart';
import 'package:meal_generator/presentation/widget/lunch/lunch_screen.dart';
import 'app_path.dart' as app_path;
import 'di/service_locator.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings, BuildContext context) {
    switch (routeSettings.name) {
      case app_path.lunch:
        return MaterialPageRoute(builder: (context) {
          return LunchScreen();
        });
      default:
        return MaterialPageRoute<Scaffold>(builder: (context) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${routeSettings.name}')),
          );
        });
    }
  }
}
