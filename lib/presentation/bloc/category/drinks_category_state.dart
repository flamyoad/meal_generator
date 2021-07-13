import 'package:equatable/equatable.dart';
import 'package:meal_generator/presentation/models/drinks_category.dart';

class DrinksCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DrinksCategoryLoading extends DrinksCategoryState {}

class DrinksCategoryLoaded extends DrinksCategoryState {
  final List<DrinksCategory> items;

  DrinksCategoryLoaded(this.items);

  @override
  List<Object?> get props => items;
}

class DrinksCategoryError extends DrinksCategoryState {
  final Exception exception;

  DrinksCategoryError(this.exception);

  @override
  List<Object?> get props => [exception];
}

class DrinksCategorySelected extends DrinksCategoryState {
  final List<DrinksCategory> items;

  DrinksCategorySelected(this.items);

  @override
  List<Object?> get props => items;
}

class DrinksCategoryUnselected extends DrinksCategoryState {
  final List<DrinksCategory> items;

  DrinksCategoryUnselected(this.items);

  @override
  List<Object?> get props => items;
}