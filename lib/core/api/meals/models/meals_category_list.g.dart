// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsCategoryList _$MealsCategoryListFromJson(Map<String, dynamic> json) {
  return MealsCategoryList(
    (json['categories'] as List<dynamic>)
        .map((e) => MealsCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealsCategoryListToJson(MealsCategoryList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

MealsCategory _$MealsCategoryFromJson(Map<String, dynamic> json) {
  return MealsCategory(
    json['idCategory'] as String,
    json['strCategory'] as String,
    json['strCategoryDescription'] as String,
    json['strCategoryThumb'] as String,
  );
}

Map<String, dynamic> _$MealsCategoryToJson(MealsCategory instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnailUrl,
      'strCategoryDescription': instance.description,
    };
