import 'package:json_annotation/json_annotation.dart';

part 'drinks_category_list.g.dart';

@JsonSerializable()
class DrinksCategoryList {
  @JsonKey(name: 'drinks')
  List<DrinksCategory> categories;

  DrinksCategoryList(this.categories);

  factory DrinksCategoryList.fromJson(Map<String, dynamic> json) => _$DrinksCategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryListToJson(this);
}

@JsonSerializable()
class DrinksCategory {
  @JsonKey(name: 'strCategory') String name;

  DrinksCategory(this.name);

  factory DrinksCategory.fromJson(Map<String, dynamic> json) => _$DrinksCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryToJson(this);
}
