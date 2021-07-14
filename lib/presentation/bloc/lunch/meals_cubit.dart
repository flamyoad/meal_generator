import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/lunch/meals_state.dart';
import 'package:meal_generator/core/extensions/list_extensions.dart';

class MealsCubit extends Cubit<MealsState> {
  late IMealsRepository mealsRepo;
  late String mealCategory;

  MealsCubit(this.mealsRepo, this.mealCategory) : super(MealsLoading());

  void load() async {
    var allMeals = await mealsRepo.getAllMealsByCategory(mealCategory);
    allMeals.fold((exception) => emit(MealsError(exception)), (mealsList) {
      emit(MealsLoaded(mealsList.random()));
    });
  }

  void reload() {
    emit(MealsLoading());
    load();
  }
}
