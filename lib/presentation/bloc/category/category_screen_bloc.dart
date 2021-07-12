import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/category_screen_event.dart';
import 'package:meal_generator/presentation/bloc/category/category_screen_state.dart';

class CategoryScreenBloc extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  
  late IMealsRepository mealRepo;
  late IDrinkRepository drinkRepo;
  
  CategoryScreenBloc(this.mealRepo, this.drinkRepo) : super(CategoryScreenEmptyState());
  
  @override
  Stream<CategoryScreenState> mapEventToState(CategoryScreenEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}