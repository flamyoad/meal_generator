import 'package:bloc/bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';
import 'package:rxdart/rxdart.dart';

class MainCategoryBloc extends Bloc<MainCategoryEvent, MainCategoryState> {
  final MealsCategoryBloc mealsCategoryBloc;
  final DrinksCategoryBloc drinksCategoryBloc;

  Stream<bool> userHasChosenMealsAndDrinks() =>
      Rx.combineLatest2(mealsCategoryBloc.stream, drinksCategoryBloc.stream, (meals, drinks) {
        return meals is MealsCategorySelected && drinks is DrinksCategorySelected;
      });

  MainCategoryBloc({required this.mealsCategoryBloc, required this.drinksCategoryBloc})
      : super(MainCategoryStateNotChosenMealAndDrinks());

  @override
  Stream<MainCategoryState> mapEventToState(MainCategoryEvent event) {
    throw UnimplementedError();
  }

  MealsCategory? getSelectedMealsCategory() {
    var state = mealsCategoryBloc.state;
    if (state is MealsCategorySelected) {
      return state.getSelectedCategory();
    }
    return null;
  }

  DrinksCategory? getSelectedDrinksCategory() {
    var state = drinksCategoryBloc.state;
    if (state is DrinksCategorySelected) {
      return state.getSelectedCategory();
    }
    return null;
  }
}
