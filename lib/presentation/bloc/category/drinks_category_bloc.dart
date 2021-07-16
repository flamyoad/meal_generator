import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';

class DrinksCategoryBloc extends Bloc<DrinksCategoryEvent, DrinksCategoryState> {
  late IDrinksRepository drinksRepo;

  DrinksCategoryBloc(this.drinksRepo) : super(DrinksCategoryLoading());

  @override
  Stream<DrinksCategoryState> mapEventToState(DrinksCategoryEvent event) async* {
    if (event is DrinksCategoryInitialLoad) {
      yield DrinksCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is DrinksCategoryReload) {
      yield DrinksCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is DrinksCategoryClicked) {
      yield _itemClicked(event.category, event.categoryList);
    }
  }

  Future<DrinksCategoryState> _proceedToLoad() async {
    var result = await drinksRepo.getAllCategories();

    return result.fold((exception) => DrinksCategoryError(exception), (drinkCategories) {
      return DrinksCategoryLoaded(drinkCategories);
    });
  }

  DrinksCategoryState _itemClicked(UiDrinksCategory clickedItem, List<UiDrinksCategory> oldList) {
    bool toggledState = !clickedItem.isSelected;
    var newList = oldList
        .map((it) => UiDrinksCategory(
        name: it.name,
        isSelected: (it.name == clickedItem.name) ? toggledState : false)
    ).toList();

    if (toggledState) {
      return DrinksCategorySelected(newList);
    } else {
      return DrinksCategoryUnselected(newList);
    }
  }
}
