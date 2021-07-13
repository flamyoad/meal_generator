import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';

class DrinksCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksCategoryScreenState();
}

class DrinksCategoryScreenState extends State<DrinksCategoryScreen> {

  late DrinksCategoryBloc drinksBloc;

  @override
  void initState() {
    drinksBloc = BlocProvider.of<DrinksCategoryBloc>(context);
    drinksBloc.add(DrinksCategoryInitialLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinksCategoryBloc, DrinksCategoryState>(builder: (context, state) {
      if (state is DrinksCategoryLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is DrinksCategoryLoaded) {
        return Container(
          child: _buildList(state.items),
        );
      } else if (state is DrinksCategoryError) {
        return Text('Error');
      } else {
        throw Error();
      }
    });
  }

  Widget _buildList(List<DrinksCategory> categories) {
    return ListView.builder(itemBuilder: (context, i) {
      var item = categories[i];
      return ListTile(
        leading: Icon(Icons.local_drink_rounded, color: Colors.purple),
        title: Text(item.name),
        onTap: () {},
      );
    }, itemCount: categories.length,);
  }
}