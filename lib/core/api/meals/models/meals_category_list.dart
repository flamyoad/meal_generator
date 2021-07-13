import 'package:json_annotation/json_annotation.dart';

part 'meals_category_list.g.dart';

@JsonSerializable()
class MealsCategoryListJson {
  List<MealsCategoryJson> categories;

  MealsCategoryListJson(this.categories);

  factory MealsCategoryListJson.fromJson(Map<String, dynamic> json) => _$MealsCategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryListToJson(this);
}

@JsonSerializable()
class MealsCategoryJson {
  @JsonKey(name: 'idCategory')
  String id;
  @JsonKey(name: 'strCategory')
  String name;
  @JsonKey(name: 'strCategoryThumb')
  String thumbnailUrl;
  @JsonKey(name: 'strCategoryDescription')
  String description;

  MealsCategoryJson(this.id, this.name, this.description, this.thumbnailUrl);

  factory MealsCategoryJson.fromJson(Map<String, dynamic> json) => _$MealsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryToJson(this);
}
