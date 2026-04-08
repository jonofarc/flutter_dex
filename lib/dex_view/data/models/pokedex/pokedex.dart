import 'package:flutter_dex/dex_view/data/models/pokedex/descriptions.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/language.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/names.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/version_groups.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokedex.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokedex {
  final List<Descriptions>? descriptions;
  final int? id;
  @JsonKey(name: 'is_main_series')
  final bool? isMainSeries;
  final String? name;
  final List<Names>? names;
  @JsonKey(name: 'pokemon_entries')
  final List<PokemonEntry>? pokemonEntries;
  final Language? region;
  @JsonKey(name: 'version_groups')
  final List<VersionGroups>? versionGroups;

  Pokedex({
    this.descriptions,
    this.id,
    this.isMainSeries,
    this.name,
    this.names,
    this.pokemonEntries,
    this.region,
    this.versionGroups,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => _$PokedexFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}
