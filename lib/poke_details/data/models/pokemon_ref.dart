import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ref.g.dart';

@JsonSerializable()
class PokemonRef {
  final String? name;
  final String? url;

  PokemonRef({this.name, this.url});

  factory PokemonRef.fromJson(Map<String, dynamic> json) => _$PokemonRefFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonRefToJson(this);
}
