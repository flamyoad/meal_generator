import 'package:json_annotation/json_annotation.dart';

part 'drinks_category_list.g.dart';

@JsonSerializable()
class DrinksCategoryListJson {
  @JsonKey(name: 'drinks')
  List<DrinksCategoryJson> categories;

  DrinksCategoryListJson(this.categories);

  factory DrinksCategoryListJson.fromJson(Map<String, dynamic> json) => _$DrinksCategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryListToJson(this);
}

@JsonSerializable()
class DrinksCategoryJson {
  @JsonKey(name: 'strCategory') String name;

  DrinksCategoryJson(this.name);

  factory DrinksCategoryJson.fromJson(Map<String, dynamic> json) => _$DrinksCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryToJson(this);
}
