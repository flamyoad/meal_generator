// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksCategoryListJson _$DrinksCategoryListFromJson(Map<String, dynamic> json) {
  return DrinksCategoryListJson(
    (json['drinks'] as List<dynamic>)
        .map((e) => DrinksCategoryJson.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DrinksCategoryListToJson(DrinksCategoryListJson instance) =>
    <String, dynamic>{
      'drinks': instance.categories,
    };

DrinksCategoryJson _$DrinksCategoryFromJson(Map<String, dynamic> json) {
  return DrinksCategoryJson(
    json['strCategory'] as String,
  );
}

Map<String, dynamic> _$DrinksCategoryToJson(DrinksCategoryJson instance) =>
    <String, dynamic>{
      'strCategory': instance.name,
    };
