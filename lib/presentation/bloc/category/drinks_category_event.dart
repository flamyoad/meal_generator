import 'package:equatable/equatable.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';

class DrinksCategoryEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class DrinksCategoryInitialLoad extends DrinksCategoryEvent {}

class DrinksCategoryReload extends DrinksCategoryEvent {}

class DrinksCategoryClicked extends DrinksCategoryEvent {
  final UiDrinksCategory category;
  final List<UiDrinksCategory> categoryList;

  DrinksCategoryClicked(this.category, this.categoryList);

  @override
  List<Object> get props => [category];
}