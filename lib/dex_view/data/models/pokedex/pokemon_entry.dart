import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_species.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonEntry {
  @JsonKey(name: 'entry_number')
  final int? entryNumber;
  @JsonKey(name: 'pokemon_species')
  final PokemonSpecies? pokemonSpecies;

  PokemonEntry({this.entryNumber, this.pokemonSpecies});

  factory PokemonEntry.fromJson(Map<String, dynamic> json) => _$PokemonEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEntryToJson(this);
}
