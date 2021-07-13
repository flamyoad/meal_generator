import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_bloc.dart';
import 'package:meal_generator/presentation/widget/category/drinks_category_screen.dart';
import 'package:meal_generator/presentation/widget/category/meals_category_screen.dart';

class MainCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  late MainCategoryBloc mainCategoryBloc;

  @override
  void initState() {
    super.initState();
    mainCategoryBloc = BlocProvider.of<MainCategoryBloc>(context);
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
        stream: mainCategoryBloc.userHasChosenMealsAndDrinks(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          var isEnabled = snapshot.data ?? false;
          return FloatingActionButton(
              onPressed: isEnabled ?  _displayLunchScreen : null,
              backgroundColor: isEnabled ? null : Colors.grey, // null means use inherited theme color
              child: Icon(
                Icons.shopping_cart,
              ));
        },
      ),
    );
  }

  void _displayLunchScreen() {

  }

  Widget _buildHeader() {
    return Card(
      color: Colors.black,
      child: Text('Please select your choice of food and drink',
          style: TextStyle(color: Colors.white)),
    );
  }
}
