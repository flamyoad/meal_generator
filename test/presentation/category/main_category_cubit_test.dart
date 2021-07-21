import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_cubit.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';
import 'package:mocktail/mocktail.dart';

class MockMealsCategoryBloc extends MockBloc<MealsCategoryEvent, MealsCategoryState>
    implements MealsCategoryBloc {}

class MockDrinksCategoryBloc extends MockBloc<DrinksCategoryEvent, DrinksCategoryState>
    implements DrinksCategoryBloc {}

void main() {
  group('Main Category Cubit', () {
    late MockMealsCategoryBloc _mealsBloc;
    late MockDrinksCategoryBloc _drinksBloc;
    late MainCategoryCubit _mainCategoryCubit;

    // Need to register fallback value for Bloc's Event/State if project is using null safety
    // https://github.com/felangel/bloc/issues/2233
    setUpAll(() {
      registerFallbackValue(MealsCategoryLoading());
      registerFallbackValue(MealsCategoryInitialLoad());
      registerFallbackValue(DrinksCategoryLoading());
      registerFallbackValue(DrinksCategoryInitialLoad());
    });

    setUp(() {
      _mealsBloc = MockMealsCategoryBloc();
      _drinksBloc = MockDrinksCategoryBloc();
      _mainCategoryCubit =
          MainCategoryCubit(mealsCategoryBloc: _mealsBloc, drinksCategoryBloc: _drinksBloc);
    });

    var mockedMealCategoryList = [
      UiMealsCategory(
          id: '1',
          name: 'Food',
          thumbnailUrl: 'food.jpg',
          description: 'Food Description',
          isSelected: true)
    ];

    var mockedDrinkCategoryList = [UiDrinksCategory(name: 'Drink', isSelected: true)];

    test('When meal and drink are selected, enable Floating Action Button', () {
      whenListen(
          _mealsBloc, Stream.fromIterable([MealsCategorySelected(mockedMealCategoryList)]));
      whenListen(
          _drinksBloc, Stream.fromIterable([DrinksCategorySelected(mockedDrinkCategoryList)]));

      expect(_mainCategoryCubit.userHasChosenMealsAndDrinks(), emits(true));
    });

    test('When one of meal and drink is not selected, disable Floating Action Button', () {
      whenListen(
          _mealsBloc, Stream.fromIterable([MealsCategoryUnselected(mockedMealCategoryList)]));
      whenListen(
          _drinksBloc, Stream.fromIterable([DrinksCategorySelected(mockedDrinkCategoryList)]));

      expect(_mainCategoryCubit.userHasChosenMealsAndDrinks(), emits(false));
    });

    test('When both meal and drink are not selected, disable Floating Action Button', () {
      whenListen(
          _mealsBloc, Stream.fromIterable([MealsCategoryUnselected(mockedMealCategoryList)]));
      whenListen(_drinksBloc,
          Stream.fromIterable([DrinksCategoryUnselected(mockedDrinkCategoryList)]));

      expect(_mainCategoryCubit.userHasChosenMealsAndDrinks(), emits(false));
    });
  });
}
