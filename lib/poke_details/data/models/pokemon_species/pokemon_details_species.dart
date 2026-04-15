import 'package:flutter_dex/poke_details/data/models/pokemon_species/flavor_text_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_species.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonDetailsSpecies {
  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorTextEntry>? flavorTextEntries;

  PokemonDetailsSpecies({
    this.flavorTextEntries,
  });

  factory PokemonDetailsSpecies.fromJson(Map<String, dynamic> json) => _$PokemonDetailsSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsSpeciesToJson(this);
}
