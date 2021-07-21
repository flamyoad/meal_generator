import 'package:equatable/equatable.dart';

class UiDrinksCategory extends Equatable {
  String name;
  bool isSelected;

  UiDrinksCategory({required this.name, required this.isSelected});

  @override
  List<Object?> get props => [name, isSelected];
}
