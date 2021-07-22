import 'package:equatable/equatable.dart';
import 'package:meal_generator/core/api/meals/models/meals_list.dart';

class MealsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealsLoading extends MealsState {
}

class MealsLoaded extends MealsState {
  final Meals meals;

  MealsLoaded(this.meals);

  @override
  List<Object?> get props => [meals];
}

class MealsError extends MealsState {
  final Exception exception;

  MealsError(this.exception);

  @override
  List<Object?> get props => [exception];
}