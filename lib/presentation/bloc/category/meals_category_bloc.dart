import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealsCategoryBloc extends Bloc<MealsCategoryEvent, MealsCategoryState> {

  final IMealsRepository mealRepo;

  MealsCategoryBloc(this.mealRepo, MealsCategoryState initialState) : super(initialState);

  @override
  Stream<MealsCategoryState> mapEventToState(MealsCategoryEvent event) async* {
    if (event is MealsCategoryInitialLoad) {
      yield MealsCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is MealsCategoryReload) {
      yield MealsCategoryLoading();
      yield await _proceedToLoad();
    }
    // else if (event is MealsCategorySelected) {
    //   yield _selectCategory(event.category);
    // }
  }


  @override
  void onTransition(Transition<MealsCategoryEvent, MealsCategoryState> transition) {
    super.onTransition(transition);
    if (transition.event is MealsCategoryLoaded) {

    }
  }

  Future<MealsCategoryState> _proceedToLoad() async {
    var result = await mealRepo.getAllCategories();
    return result.fold((exception) => MealsCategoryError(exception),
        (mealCategories) => MealsCategoryLoaded(mealCategories));
  }

  // MealsCategoryState _selectCategory(MealsCategory category) {
  //
  // }
}
