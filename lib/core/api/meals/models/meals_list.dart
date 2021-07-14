
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'meals_list.g.dart';

@JsonSerializable()
class MealsList {
  @JsonKey(name: 'meals') List<Meals> list;

  MealsList(this.list);

  factory MealsList.fromJson(Map<String, dynamic> json) => _$MealsListFromJson(json);

  Map<String, dynamic> toJson() => _$MealsListToJson(this);
}

@JsonSerializable()
class Meals {
  @JsonKey(name: 'idMeal') String id;
  @JsonKey(name: 'strMeal') String name;
  @JsonKey(name: 'strMealThumb') String thumbnailUrl;

  Meals(this.id, this.name, this.thumbnailUrl);

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);

  Map<String, dynamic> toJson() => _$MealsToJson(this);
}