import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_generator/app_settings.dart';
import 'package:meal_generator/core/api/environment.dart';
import 'package:meal_generator/core/app_routes.dart';
import 'package:meal_generator/core/di/service_locator.dart';
import 'package:meal_generator/core/repository/meals/i_meals_repository.dart';
import 'package:meal_generator/core/repository/settings_repository.dart';
import 'package:meal_generator/presentation/bloc/category/drinks_category_bloc.dart';
import 'package:meal_generator/presentation/bloc/category/main_category_cubit.dart';
import 'package:meal_generator/presentation/bloc/category/meals_category_bloc.dart';
import 'package:meal_generator/presentation/widget/category/main_category_screen.dart';
import 'package:meal_generator/core/app_path.dart' as app_path;
import 'package:meal_generator/presentation/widget/options/options_screen.dart';

import 'core/repository/drinks/i_drinks_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registerServiceLocator(DevEnvironment());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(ignorePendingAsyncCreation: false),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AppSettings(
            child: Builder(
              builder: (context) {
                return MaterialApp(
                    title: 'Flutter Demo',
                    // themeMode only works if both theme/dark theme is provided
                    // themeMode: _settingsRepository.darkModeEnabled
                    //     ? ThemeMode.dark
                    //     : ThemeMode.system,
                    themeMode: AppSettingsChanger.getTheme(context),
                    theme:
                        ThemeData(primarySwatch: Colors.purple, brightness: Brightness.light),
                    darkTheme:
                        ThemeData(primaryColor: Colors.amber, brightness: Brightness.dark),
                    onGenerateRoute: (RouteSettings routeSettings) {
                      return AppRoutes.generateRoute(routeSettings, context);
                    },
                    home: Scaffold(
                        appBar: AppBar(
                          title: Text('Meal Selector'),
                          centerTitle: true,
                          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
                        ),
                        body: _buildPageView(),
                        bottomNavigationBar: Builder(builder: (context) {
                          return BottomNavigationBar(
                            items: [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.widgets), label: 'Home'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.settings), label: 'Settings')
                            ],
                            currentIndex: _selectedIndex,
                            onTap: _onItemTapped,
                          );
                        })));
              },
            ),
          );
        } else {
          // This is shown while GetIt is initializing the async dependencies such as Db
          return Container();
        }
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.jumpToPage(index);
  }

  Widget _buildPageView() {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: 2,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return MultiBlocProvider(
                providers: [
                  BlocProvider<MealsCategoryBloc>(
                      create: (context) => MealsCategoryBloc(sl.get<IMealsRepository>())),
                  BlocProvider<DrinksCategoryBloc>(
                      create: (context) => DrinksCategoryBloc(sl.get<IDrinksRepository>())),
                  BlocProvider<MainCategoryCubit>(
                      create: (context) => MainCategoryCubit(
                          mealsCategoryBloc: BlocProvider.of<MealsCategoryBloc>(context),
                          drinksCategoryBloc: BlocProvider.of<DrinksCategoryBloc>(context))),
                ],
                child: MainCategoryScreen(),
              );
            case 1:
              return OptionsScreen();
            default:
              throw UnimplementedError();
          }
        });
  }
}
