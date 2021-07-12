import 'package:json_annotation/json_annotation.dart';

part 'meals_category_list.g.dart';

@JsonSerializable()
class MealsCategoryList {
  List<MealsCategory> categories;

  MealsCategoryList(this.categories);

  factory MealsCategoryList.fromJson(Map<String, dynamic> json) => _$MealsCategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryListToJson(this);
}

@JsonSerializable()
class MealsCategory {
  @JsonKey(name: 'idCategory')
  int id;
  @JsonKey(name: 'strCategory')
  String name;
  @JsonKey(name: 'strCategoryThumb')
  String thumbnailUrl;
  @JsonKey(name: 'strCategoryDescription')
  String description;

  MealsCategory(this.id, this.name, this.description, this.thumbnailUrl);

  factory MealsCategory.fromJson(Map<String, dynamic> json) => _$MealsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryToJson(this);
}
