import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';

class DrinksCategoryBloc extends Bloc<DrinksCategoryEvent, DrinksCategoryState> {
  late IDrinksRepository drinksRepo;

  List<UiDrinksCategory> drinksCategories = List.empty();

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
      yield _itemClicked(event.category);
    }
  }

  @override
  void onTransition(Transition<DrinksCategoryEvent, DrinksCategoryState> transition) {
    super.onTransition(transition);
  }

  Future<DrinksCategoryState> _proceedToLoad() async {
    var result = await drinksRepo.getAllCategories();

    return result.fold((exception) => DrinksCategoryError(exception), (drinkCategories) {
      this.drinksCategories = drinkCategories;
      return DrinksCategoryLoaded(drinkCategories);
    });
  }

  DrinksCategoryState _itemClicked(UiDrinksCategory clickedItem) {
    bool newState = !clickedItem.isSelected;
    var newList = drinksCategories
        .map((it) => UiDrinksCategory(
        name: it.name,
        isSelected: (it.name == clickedItem.name) ? newState : it.isSelected)
    ).toList();

    if (newState) {
      return DrinksCategorySelected(newList);
    } else {
      return DrinksCategoryUnselected(newList);
    }
  }
}
