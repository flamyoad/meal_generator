### Video to refresh your mind before diving in Flutter again
* [Top 30 Flutter Tips and Tricks](https://www.youtube.com/watch?v=5vDq5DXXxss) - This video features a lot of unusual but useful widgets. Worth watching to refresh your mind.


### Things that I'd love to see in Dart (that still does not exist) !!
- Copy constructor (Very handy thing in Kotlin)
```kt
  var original = Book(id = 1, name = 'The Name Jar', isSelected = false)
  var copied = original.copy(isSelected = true)
  
  // In Dart, this is still not possible. We have to construct the object manually :(
```
- Easier way to use extension functions.
At the time of writing, if we have to use an extension in Dart, we have to import them manually. IDE does not recognize and will not help you import when autocompleting.
```dart
// File name is list_extensions.dart

import 'dart:math';

extension ListExtensions<T> on List<T> {
  T random() {
    var index = Random().nextInt(this.length);
    return this[index];
  }
}
```
```dart
import 'package:meal_generator/core/extensions/list_extensions.dart'; // We have to import manually!!!

class MealsCubit extends Cubit<MealsState> {
  late IMealsRepository mealsRepo;
  late String mealCategory;

  MealsCubit(this.mealsRepo, this.mealCategory) : super(MealsLoading());

  void load() async {
    var allMeals = await mealsRepo.getAllMealsByCategory(mealCategory);
    allMeals.fold((exception) => emit(MealsError(exception)), (mealsList) {
      emit(MealsLoaded(mealsList.random()));
    });
  }

  void reload() {
    emit(MealsLoading());
    load();
  }
}
```
