import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species.g.dart';

@JsonSerializable()
class PokemonSpecies {
  final String? name;
  final String? url;

  PokemonSpecies({this.name, this.url});

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => _$PokemonSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);
}
