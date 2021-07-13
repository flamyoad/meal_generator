import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealsCategoryBloc extends Bloc<MealsCategoryEvent, MealsCategoryState> {
  final IMealsRepository mealRepo;

  List<MealsCategory> mealCategories = List.empty();

  MealsCategoryBloc(this.mealRepo, MealsCategoryState initialState) : super(initialState);

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
    var result = await mealRepo.getAllCategories();

    return result.fold((exception) => MealsCategoryError(exception), (mealCategories) {
      this.mealCategories = mealCategories;
      return MealsCategoryLoaded(mealCategories);
    });
  }

  MealsCategoryState _itemClicked(MealsCategory clickedItem) {
    // Reverses the state of the item clicked.
    bool newState = !clickedItem.isSelected;
    var newList = mealCategories
        .map((it) => MealsCategory(
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
