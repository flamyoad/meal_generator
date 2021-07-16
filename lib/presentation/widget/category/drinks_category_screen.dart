import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/api/drinks/models/drinks_category_list.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_state.dart';
import 'package:meal_generator/presentation/models/ui_drinks_category.dart';
import 'package:meal_generator/presentation/widget/list_error_indicator.dart';

import '../list_loading_indicator.dart';

class DrinksCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksCategoryScreenState();
}

class DrinksCategoryScreenState extends State<DrinksCategoryScreen> {
  late DrinksCategoryBloc _drinksBloc;

  @override
  void initState() {
    super.initState();
    _drinksBloc = BlocProvider.of<DrinksCategoryBloc>(context);
    _drinksBloc.add(DrinksCategoryInitialLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinksCategoryBloc, DrinksCategoryState>(builder: (context, state) {
      if (state is DrinksCategoryLoading) {
        return ListLoadingIndicator();
      } else if (state is DrinksCategoryLoaded) {
        return _buildList(state.items);
      } else if (state is DrinksCategorySelected) {
        return _buildList(state.items);
      } else if (state is DrinksCategoryUnselected) {
        return _buildList(state.items);
      } else if (state is DrinksCategoryError) {
        return ListErrorIndicator(_reloadList);
      } else {
        throw Error();
      }
    });
  }

  void _reloadList() {
    _drinksBloc.add(DrinksCategoryReload());
  }

  Widget _buildList(List<UiDrinksCategory> categoryList) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, i) {
        var category = categoryList[i];
        return Container(
          margin: const EdgeInsets.fromLTRB(4, 4, 4, 0),
          child: Card(
            elevation: 2.0,
            child: ListTile(
              leading: Icon(Icons.local_drink_rounded,
                  color: category.isSelected ? Colors.blue : Colors.grey),
              title: Text(category.name),
              onTap: () {
                _drinksBloc.add(DrinksCategoryClicked(category, categoryList));
              },
            ),
          ),
        );
      }, childCount: categoryList.length),
    );
  }
}
