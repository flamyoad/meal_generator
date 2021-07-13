import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';

class DrinksCategoryBloc extends Bloc<DrinksCategoryEvent, DrinksCategoryState> {
  late IDrinkRepository drinksRepo;

  DrinksCategoryBloc(this.drinksRepo, DrinksCategoryState initialState) : super(initialState);

  @override
  Stream<DrinksCategoryState> mapEventToState(DrinksCategoryEvent event) async* {
    if (event is DrinksCategoryInitialLoad) {
      yield DrinksCategoryLoading();
      yield await _proceedToLoad();
    } else if (event is DrinksCategoryReload) {
      yield DrinksCategoryLoading();
      yield await _proceedToLoad();
    }
  }

  @override
  void onTransition(Transition<DrinksCategoryEvent, DrinksCategoryState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  Future<DrinksCategoryState> _proceedToLoad() async {
    var result = await drinksRepo.getAllCategories();
    return result.fold((exception) => DrinksCategoryError(exception),
        (drinkCategories) => DrinksCategoryLoaded(drinkCategories));
  }
}
