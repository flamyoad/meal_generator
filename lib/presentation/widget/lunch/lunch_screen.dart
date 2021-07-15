import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/presentation/bloc/lunch/drinks_cubit.dart';
import 'package:meal_generator/presentation/bloc/lunch/drinks_state.dart';
import 'package:meal_generator/presentation/bloc/lunch/meals_cubit.dart';
import 'package:meal_generator/presentation/bloc/lunch/meals_state.dart';
import 'package:meal_generator/presentation/widget/lunch/lunch_item.dart';

class LunchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  late MealsCubit mealsCubit;
  late DrinksCubit drinksCubit;

  @override
  void initState() {
    super.initState();
    mealsCubit = BlocProvider.of(context)..load();
    drinksCubit = BlocProvider.of(context)..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lunch of the day'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Flexible(child: _buildMeals()), Flexible(child: _buildDrinks())],
            ),
            _buildRefreshLabel()
          ],
        ));
  }

  Widget _buildMeals() {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return _buildLoadingIndicator();
        } else if (state is MealsLoaded) {
          var meals = state.meals;
          return LunchItem(name: meals.name, imageUrl: meals.thumbnailUrl);
        } else if (state is MealsError) {
          return Text('Error');
        } else {
          throw UnimplementedError();
        }
      },
    );
  }

  Widget _buildDrinks() {
    return BlocBuilder<DrinksCubit, DrinksState>(
      builder: (context, state) {
        if (state is DrinksLoading) {
          return _buildLoadingIndicator();
        } else if (state is DrinksLoaded) {
          var drinks = state.drinks;
          return LunchItem(name: drinks.name, imageUrl: drinks.thumbnailUrl);
        } else if (state is DrinksError) {
          return Text('Error');
        } else {
          throw UnimplementedError();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      height: 250,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildRefreshLabel() {
    return InkWell(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(style: Theme.of(context).textTheme.bodyText2, children: [
              WidgetSpan(
                  child: Icon(Icons.star, color: Colors.red),
                  alignment: PlaceholderAlignment.middle),
              TextSpan(text: '  Click here to get another meal set!')
            ]),
          )),
      onTap: () {
        mealsCubit.reload();
        drinksCubit.reload();
      },
    );
  }
}
