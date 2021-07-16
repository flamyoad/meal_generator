import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

class MealsCategoryBloc extends Bloc<MealsCategoryEvent, MealsCategoryState> {
  final IMealsRepository mealsRepo;

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
      yield _itemClicked(event.category, event.categoryList);
    }
  }

  Future<MealsCategoryState> _proceedToLoad() async {
    var result = await mealsRepo.getAllCategories();

    return result.fold((exception) => MealsCategoryError(exception), (mealsCategories) {
      return MealsCategoryLoaded(mealsCategories);
    });
  }

  MealsCategoryState _itemClicked(UiMealsCategory clickedItem, List<UiMealsCategory> oldList) {
    // Toggles the state of the item clicked to Selected/Unselected
    bool toggledState = !clickedItem.isSelected;
    var newList = oldList
        .map((it) => UiMealsCategory(
            id: it.id,
            name: it.name,
            thumbnailUrl: it.thumbnailUrl,
            description: it.description,
            isSelected: (it.id == clickedItem.id) ? toggledState : false))
        .toList();

    if (toggledState) {
      return MealsCategorySelected(newList);
    } else {
      return MealsCategoryUnselected(newList);
    }
  }
}
