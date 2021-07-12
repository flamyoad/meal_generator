import 'package:json_annotation/json_annotation.dart';

part 'drinks_category_list.g.dart';

@JsonSerializable()
class DrinksCategoryList {
  List<DrinksCategory> categories;

  DrinksCategoryList(this.categories);

  factory DrinksCategoryList.fromJson(Map<String, dynamic> json) => _$DrinksCategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryListToJson(this);
}

@JsonSerializable()
class DrinksCategory {
  @JsonKey(name: 'idCategory') int id;
  @JsonKey(name: 'strCategory') String name;
  @JsonKey(name: 'strCategoryThumb') String thumbnailUrl;
  @JsonKey(name: 'strCategoryDescription') String description;

  DrinksCategory(this.id, this.name, this.thumbnailUrl, this.description);

  factory DrinksCategory.fromJson(Map<String, dynamic> json) => _$DrinksCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryToJson(this);
}
