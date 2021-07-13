// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsCategoryListJson _$MealsCategoryListFromJson(Map<String, dynamic> json) {
  return MealsCategoryListJson(
    (json['categories'] as List<dynamic>)
        .map((e) => MealsCategoryJson.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealsCategoryListToJson(MealsCategoryListJson instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

MealsCategoryJson _$MealsCategoryFromJson(Map<String, dynamic> json) {
  return MealsCategoryJson(
    json['idCategory'] as String,
    json['strCategory'] as String,
    json['strCategoryDescription'] as String,
    json['strCategoryThumb'] as String,
  );
}

Map<String, dynamic> _$MealsCategoryToJson(MealsCategoryJson instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnailUrl,
      'strCategoryDescription': instance.description,
    };
