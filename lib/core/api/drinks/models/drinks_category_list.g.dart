// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksCategoryList _$DrinksCategoryListFromJson(Map<String, dynamic> json) {
  return DrinksCategoryList(
    (json['categories'] as List<dynamic>)
        .map((e) => DrinksCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DrinksCategoryListToJson(DrinksCategoryList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

DrinksCategory _$DrinksCategoryFromJson(Map<String, dynamic> json) {
  return DrinksCategory(
    json['idCategory'] as int,
    json['strCategory'] as String,
    json['strCategoryThumb'] as String,
    json['strCategoryDescription'] as String,
  );
}

Map<String, dynamic> _$DrinksCategoryToJson(DrinksCategory instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnailUrl,
      'strCategoryDescription': instance.description,
    };
