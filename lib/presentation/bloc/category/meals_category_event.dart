import 'package:equatable/equatable.dart';
import 'package:meal_generator/presentation/models/ui_meals_category.dart';

class MealsCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealsCategoryInitialLoad extends MealsCategoryEvent {}

class MealsCategoryReload extends MealsCategoryEvent {}

class MealsCategoryClicked extends MealsCategoryEvent {
  final UiMealsCategory category;

  MealsCategoryClicked(this.category);

  @override
  List<Object?> get props => [category];
}
