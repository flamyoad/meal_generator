import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';
import 'package:mockito/mockito.dart';

import '../../shared_mocks.mocks.dart';

void main() {
  var mockDrinksRepository = MockIDrinksRepository();

  group('Drinks Category Bloc', () {
    late DrinksCategoryBloc _bloc;

    setUp(() {
      _bloc = DrinksCategoryBloc(mockDrinksRepository);
    });

    test('Initial state is Loading', () {
      expect(_bloc.state, DrinksCategoryLoading());
    });

    var categoryList = [UiDrinksCategory(name: 'Cocktail', isSelected: true)];
    blocTest<DrinksCategoryBloc, DrinksCategoryState>(
        'When InitialLoad succeed, show Loading followed by Loaded',
        build: () {
          when(mockDrinksRepository.getAllCategories())
              .thenAnswer((_) async => Right(categoryList));
          return _bloc;
        },
        act: (bloc) => bloc.add(DrinksCategoryInitialLoad()),
        expect: () => <DrinksCategoryState>[
              DrinksCategoryLoading(),
              DrinksCategoryLoaded(categoryList)
            ]);

    var exception = Exception();
    blocTest<DrinksCategoryBloc, DrinksCategoryState>(
        'When InitialLoad failed, show Loading followed by Error',
        build: () {
          when(mockDrinksRepository.getAllCategories())
              .thenAnswer((_) async => Left(exception));
          return _bloc;
        },
        act: (bloc) => bloc.add(DrinksCategoryInitialLoad()),
        expect: () =>
            <DrinksCategoryState>[DrinksCategoryLoading(), DrinksCategoryError(exception)]);

    var unselectedItem = UiDrinksCategory(name: 'Cocktail', isSelected: false);
    var selectedItem = UiDrinksCategory(name: 'Cocktail', isSelected: true);
    blocTest<DrinksCategoryBloc, DrinksCategoryState>(
        'When an unselected item is clicked, emit DrinksCategorySelected event',
        build: () => _bloc,
        act: (bloc) => bloc.add(DrinksCategoryClicked(unselectedItem, [unselectedItem])),
        expect: () => <DrinksCategoryState>[
              DrinksCategorySelected([selectedItem])
            ]);

    blocTest<DrinksCategoryBloc, DrinksCategoryState>(
        'When a selected item is clicked, emit DrinksCategoryUnselected event',
        build: () => _bloc,
        act: (bloc) => bloc.add(DrinksCategoryClicked(selectedItem, [selectedItem])),
        expect: () => <DrinksCategoryState>[
              DrinksCategoryUnselected([unselectedItem])
            ]);
  });
}
