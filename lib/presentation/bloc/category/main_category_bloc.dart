import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_state.dart';

class MainCategoryBloc extends Bloc<MainCategoryEvent, MainCategoryState> {

  MainCategoryBloc() : super(MainCategoryStateNotChosenMealAndDrinks());
  
  @override
  Stream<MainCategoryState> mapEventToState(MainCategoryEvent event) {
    throw UnimplementedError();
  }
}