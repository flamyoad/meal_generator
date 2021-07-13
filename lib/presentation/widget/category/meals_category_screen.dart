import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_generator/core/api/meals/models/meals_category_list.dart';
import 'package:meal_generator/core/di/service_locator.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_event.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_state.dart';

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
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MealsCategoryLoaded) {
        return Container(
          child: _buildList(state.items),
        );
      } else if (state is MealsCategoryError) {
        return Text('Error');
      }
      return Text('Unknown state');
    });
  }

  Widget _buildList(List<MealsCategory> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          var item = categories[i];
          return ListTile(
            leading: SizedBox(
              child: Image.network(item.thumbnailUrl),
              height: 200,
              width: 100,
            ),
            minLeadingWidth: 0,
            title: Text(item.name),
            subtitle: Text(item.description, maxLines: 3, overflow: TextOverflow.ellipsis),
            onTap: () {},
          );
        });
  }
}
