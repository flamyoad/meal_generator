// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsList _$MealsListFromJson(Map<String, dynamic> json) {
  return MealsList(
    (json['meals'] as List<dynamic>)
        .map((e) => Meals.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealsListToJson(MealsList instance) => <String, dynamic>{
      'meals': instance.list,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) {
  return Meals(
    json['idMeal'] as String,
    json['strMeal'] as String,
    json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strMealThumb': instance.thumbnailUrl,
    };
