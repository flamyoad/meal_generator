import 'package:equatable/equatable.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealsCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealsCategoryLoading extends MealsCategoryState {
}

class MealsCategoryLoaded extends MealsCategoryState {
  final List<MealsCategory> items;

  MealsCategoryLoaded(this.items);

  @override
  List<Object?> get props => items;
}

class MealsCategoryError extends MealsCategoryState {
  final Exception exception;

  MealsCategoryError(this.exception);

  @override
  List<Object?> get props => [exception];
}