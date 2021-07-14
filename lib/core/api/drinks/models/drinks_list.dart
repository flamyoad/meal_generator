import 'package:json_annotation/json_annotation.dart';

part 'drinks_list.g.dart';

@JsonSerializable()
class DrinksList {
  @JsonKey(name: 'drinks')
  List<Drinks> list;

  DrinksList(this.list);

  factory DrinksList.fromJson(Map<String, dynamic> json) => _$DrinksListFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksListToJson(this);
}

@JsonSerializable()
class Drinks {
  @JsonKey(name: 'idDrink')
  String id;
  @JsonKey(name: 'strDrink')
  String name;
  @JsonKey(name: 'strDrinkThumb')
  String thumbnailUrl;

  Drinks(this.id, this.name, this.thumbnailUrl);

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksToJson(this);
}
