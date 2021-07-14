import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_bloc.dart';
import 'package:meal_generator/presentation/widget/category/drinks_category_screen.dart';
import 'package:meal_generator/presentation/widget/category/meals_category_screen.dart';
import 'package:meal_generator/core/app_path.dart' as app_path;

class MainCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  late MainCategoryBloc _mainCategoryBloc;

  @override
  void initState() {
    super.initState();
    _mainCategoryBloc = BlocProvider.of<MainCategoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Selector'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: CustomScrollView(
        shrinkWrap: true, // if set to false, exception will be thrown wh?y?
        slivers: [
          MealsCategoryScreen(),
          DrinksCategoryScreen(),
        ],
      ),
      floatingActionButton: StreamBuilder(
        stream: _mainCategoryBloc.userHasChosenMealsAndDrinks(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          var isEnabled = snapshot.data ?? false;
          return FloatingActionButton(
              onPressed: isEnabled ?  () => _displayLunchScreen(context) : null,
              backgroundColor: isEnabled ? null : Colors.grey, // null means use inherited theme color
              child: Icon(
                Icons.shopping_cart,
              ));
        },
      ),
    );
  }

  void _displayLunchScreen(BuildContext context) {
    var mealsCategory = _mainCategoryBloc.getSelectedMealsCategory();
    var drinksCategory = _mainCategoryBloc.getSelectedDrinksCategory();
    if (mealsCategory == null || drinksCategory == null) {
      return;
    }
    Navigator.pushNamed(context, app_path.lunch);
  }
}
