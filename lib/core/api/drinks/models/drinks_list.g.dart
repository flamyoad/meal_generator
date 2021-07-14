// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksList _$DrinksListFromJson(Map<String, dynamic> json) {
  return DrinksList(
    (json['drinks'] as List<dynamic>)
        .map((e) => Drinks.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DrinksListToJson(DrinksList instance) =>
    <String, dynamic>{
      'drinks': instance.list,
    };

Drinks _$DrinksFromJson(Map<String, dynamic> json) {
  return Drinks(
    json['idDrink'] as String,
    json['strDrink'] as String,
    json['strDrinkThumb'] as String,
  );
}

Map<String, dynamic> _$DrinksToJson(Drinks instance) => <String, dynamic>{
      'idDrink': instance.id,
      'strDrink': instance.name,
      'strDrinkThumb': instance.thumbnailUrl,
    };
