import 'package:equatable/equatable.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';

class MealsCategoryEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class MealsCategoryInitialLoad extends MealsCategoryEvent {

}

class MealsCategoryReload extends MealsCategoryEvent {

}

class MealsCategorySelected extends MealsCategoryEvent {
  final MealsCategory category;

  MealsCategorySelected(this.category);
}