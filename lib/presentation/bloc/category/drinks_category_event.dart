import 'package:equatable/equatable.dart';

class DrinksCategoryEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class DrinksCategoryInitialLoad extends DrinksCategoryEvent {

}

class DrinksCategoryReload extends DrinksCategoryEvent {

}

class DrinkCategorySelected extends DrinksCategoryEvent {

}