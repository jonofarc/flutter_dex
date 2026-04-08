import 'package:json_annotation/json_annotation.dart';

part 'pokedexes.g.dart';

@JsonSerializable()
class Pokedexes {
  String? name;
  String? url;

  Pokedexes({this.name, this.url});

  factory Pokedexes.fromJson(Map<String, dynamic> json) => _$PokedexesFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexesToJson(this);
}
