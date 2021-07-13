import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';
import 'package:meal_generator/presentation/models/meals_category.dart';
import 'package:meal_generator/presentation/widget/list_error_indicator.dart';
import 'package:meal_generator/presentation/widget/list_loading_indicator.dart';

class MealsCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MealsCategoryScreenState();
}

class _MealsCategoryScreenState extends State<MealsCategoryScreen> {
  late MealsCategoryBloc _mealCategoryBloc;

  @override
  void initState() {
    super.initState();
    _mealCategoryBloc = BlocProvider.of<MealsCategoryBloc>(context);
    _mealCategoryBloc.add(MealsCategoryInitialLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCategoryBloc, MealsCategoryState>(builder: (context, state) {
      if (state is MealsCategoryLoading) {
        return ListLoadingIndicator();
      } else if (state is MealsCategoryLoaded) {
        return _buildList(state.items);
      } else if (state is MealsCategorySelected) {
        return _buildList(state.items);
      } else if (state is MealsCategoryUnselected) {
        return _buildList(state.items);
      } else if (state is MealsCategoryError) {
        return ListErrorIndicator(_reloadList);
      }
      throw Error();
    });
  }

  void _reloadList() {
    _mealCategoryBloc.add(MealsCategoryReload());
  }

  Widget _buildList(List<MealsCategory> categories) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, i) {
        var item = categories[i];
        return Card(
          elevation: 2.0,
          child: ListTile(
            leading: _buildPhoto(item),
            title: Text(item.name),
            subtitle: Text(item.description, maxLines: 3, overflow: TextOverflow.ellipsis),
            onTap: () {
              _mealCategoryBloc.add(MealsCategoryClicked(item));
            },
          ),
        );
      },
      childCount: categories.length,
    ));
  }

  Widget _buildPhoto(MealsCategory item) {
    return SizedBox(
      child: Stack(
        children: [
          Opacity(
              child: Image.network(item.thumbnailUrl), opacity: item.isSelected ? 0.5 : 1.0),
          Center(
            child: Visibility(
              child: Icon(Icons.done, color: Colors.redAccent, size: 50.0),
              visible: item.isSelected,
            ),
          )
        ],
      ),
      height: 250,
      width: 120,
    );
  }
}
