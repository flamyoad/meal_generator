import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

class MealsCategoryBloc extends Bloc<MealsCategoryEvent, MealsCategoryState> {
  final IMealsRepository mealsRepo;

  List<UiMealsCategory> mealsCategories = List.empty();

  MealsCategoryBloc(this.mealsRepo) : super(MealsCategoryLoading());

  @override
  Stream<MealsCategoryState> mapEventToState(MealsCategoryEvent event) async* {
    if (event is MealsCategoryInitialLoad) {
      yield MealsCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is MealsCategoryReload) {
      yield MealsCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is MealsCategoryClicked) {
      yield _itemClicked(event.category);
    }
  }

  @override
  void onTransition(Transition<MealsCategoryEvent, MealsCategoryState> transition) {
    super.onTransition(transition);
  }

  Future<MealsCategoryState> _proceedToLoad() async {
    var result = await mealsRepo.getAllCategories();

    return result.fold((exception) => MealsCategoryError(exception), (mealsCategories) {
      this.mealsCategories = mealsCategories;
      return MealsCategoryLoaded(mealsCategories);
    });
  }

  MealsCategoryState _itemClicked(UiMealsCategory clickedItem) {
    // Reverses the state of the item clicked.
    bool newState = !clickedItem.isSelected;
    var newList = mealsCategories
        .map((it) => UiMealsCategory(
            id: it.id,
            name: it.name,
            thumbnailUrl: it.thumbnailUrl,
            description: it.description,
            isSelected: (it.id == clickedItem.id) ? newState : it.isSelected))
        .toList();

    if (newState) {
      return MealsCategorySelected(newList);
    } else {
      return MealsCategoryUnselected(newList);
    }
  }
}
