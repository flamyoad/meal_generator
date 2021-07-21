import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Equality for Error state: True', () {
    var exception = Exception();
    var first = DrinksCategoryError(exception);
    var second = DrinksCategoryError(exception);
    assert(first == second);
  });

  test('Equality for Error state: False', () {
    var first = DrinksCategoryError(Exception());
    var second = DrinksCategoryError(Exception());
    assert(first != second);
  });
}