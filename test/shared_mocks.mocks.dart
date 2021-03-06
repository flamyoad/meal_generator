// Mocks generated by Mockito 5.0.11 from annotations
// in meal_generator/test/shared_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:meal_generator/core/api/drinks/models/drinks_list.dart' as _i6;
import 'package:meal_generator/core/api/meals/models/meals_list.dart' as _i9;
import 'package:meal_generator/core/repository/drinks/i_drinks_repository.dart'
    as _i3;
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart'
    as _i7;
import 'package:meal_generator/presentation/models/ui_drinks_category.dart'
    as _i5;
import 'package:meal_generator/presentation/models/ui_meals_category.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {
  @override
  String toString() => super.toString();
}

/// A class which mocks [IDrinksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIDrinksRepository extends _i1.Mock implements _i3.IDrinksRepository {
  MockIDrinksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, List<_i5.UiDrinksCategory>>>
      getAllCategories() => (super.noSuchMethod(
          Invocation.method(#getAllCategories, []),
          returnValue:
              Future<_i2.Either<Exception, List<_i5.UiDrinksCategory>>>.value(
                  _FakeEither<Exception, List<_i5.UiDrinksCategory>>())) as _i4
          .Future<_i2.Either<Exception, List<_i5.UiDrinksCategory>>>);
  @override
  _i4.Future<_i2.Either<Exception, List<_i6.Drinks>>> getAllDrinksByCategory(
          String? categoryName) =>
      (super.noSuchMethod(
          Invocation.method(#getAllDrinksByCategory, [categoryName]),
          returnValue: Future<_i2.Either<Exception, List<_i6.Drinks>>>.value(
              _FakeEither<Exception, List<_i6.Drinks>>())) as _i4
          .Future<_i2.Either<Exception, List<_i6.Drinks>>>);
}

/// A class which mocks [IMealsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMealsRepository extends _i1.Mock implements _i7.IMealsRepository {
  MockIMealsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, List<_i8.UiMealsCategory>>>
      getAllCategories() => (super.noSuchMethod(
          Invocation.method(#getAllCategories, []),
          returnValue:
              Future<_i2.Either<Exception, List<_i8.UiMealsCategory>>>.value(
                  _FakeEither<Exception, List<_i8.UiMealsCategory>>())) as _i4
          .Future<_i2.Either<Exception, List<_i8.UiMealsCategory>>>);
  @override
  _i4.Future<_i2.Either<Exception, List<_i9.Meals>>> getAllMealsByCategory(
          String? categoryName) =>
      (super.noSuchMethod(
              Invocation.method(#getAllMealsByCategory, [categoryName]),
              returnValue: Future<_i2.Either<Exception, List<_i9.Meals>>>.value(
                  _FakeEither<Exception, List<_i9.Meals>>()))
          as _i4.Future<_i2.Either<Exception, List<_i9.Meals>>>);
}
