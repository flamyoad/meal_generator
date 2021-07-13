import 'package:equatable/equatable.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';

class DrinksCategoryEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class DrinksCategoryInitialLoad extends DrinksCategoryEvent {}

class DrinksCategoryReload extends DrinksCategoryEvent {}

class DrinksCategoryClicked extends DrinksCategoryEvent {
  final DrinksCategory category;

  DrinksCategoryClicked(this.category);

  @override
  List<Object> get props => [category];
}