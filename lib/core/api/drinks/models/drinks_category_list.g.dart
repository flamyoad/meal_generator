// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksCategoryList _$DrinksCategoryListFromJson(Map<String, dynamic> json) {
  return DrinksCategoryList(
    (json['drinks'] as List<dynamic>)
        .map((e) => DrinksCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DrinksCategoryListToJson(DrinksCategoryList instance) =>
    <String, dynamic>{
      'drinks': instance.categories,
    };

DrinksCategory _$DrinksCategoryFromJson(Map<String, dynamic> json) {
  return DrinksCategory(
    json['strCategory'] as String,
  );
}

Map<String, dynamic> _$DrinksCategoryToJson(DrinksCategory instance) =>
    <String, dynamic>{
      'strCategory': instance.name,
    };
