import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IDrinksRepository,
  IMealsRepository,
])
void main() {
}