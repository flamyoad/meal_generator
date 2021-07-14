import 'package:bloc/bloc.dart';
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/presentation/bloc/lunch/drinks_state.dart';
import 'package:meal_generator/core/extensions/list_extensions.dart';

class DrinksCubit extends Cubit<DrinksState> {
  late IDrinksRepository drinksRepo;
  late String drinksCategory;

  DrinksCubit(this.drinksRepo, this.drinksCategory) : super(DrinksLoading());

  void load() async {
    var allDrinks = await drinksRepo.getAllDrinksByCategory(drinksCategory);
    allDrinks.fold((exception) => emit(DrinksError(exception)), (drinksList) {
      emit(DrinksLoaded(drinksList.random()));
    });
  }

  void reload() {
    emit(DrinksLoading());
    load();
  }
}
