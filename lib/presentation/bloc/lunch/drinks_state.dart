import 'package:equatable/equatable.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_list.dart';

class DrinksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DrinksLoading extends DrinksState {
}

class DrinksLoaded extends DrinksState {
  final Drinks drinks;

  DrinksLoaded(this.drinks);

  @override
  List<Object?> get props => [drinks];
}

class DrinksError extends DrinksState {
  final Exception exception;

  DrinksError(this.exception);

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}