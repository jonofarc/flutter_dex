import 'package:flutter_dex/poke_details/data/models/pokemon/pokemon_stat.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form/pokemon_form.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_species/pokemon_details_species.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  @JsonKey(name: 'height')
  final int? height;

  @JsonKey(name: 'weight')
  final int? weight;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'is_default')
  final bool? isDefault;

  @JsonKey(name: 'pokemon_form')
  final PokemonForm? pokemonForm;

  @JsonKey(name: 'species')
  final PokemonDetailsSpecies? species;

  @JsonKey(name: 'weaknesses', defaultValue: [])
  final List<String> weaknesses;

  @JsonKey(name: 'stats')
  final List<PokemonStat>? pokemonStats;

  Pokemon({
    this.height,
    this.weight,
    this.id,
    this.isDefault,
    this.pokemonForm,
    this.species,
    this.pokemonStats,
    this.weaknesses = const [],
  });

  Pokemon copyWith({
    int? height,
    int? weight,
    int? id,
    bool? isDefault,
    PokemonForm? pokemonForm,
    PokemonDetailsSpecies? species,
    List<String>? weaknesses,
    List<PokemonStat>? pokemonStats,
  }) {
    return Pokemon(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      pokemonForm: pokemonForm ?? this.pokemonForm,
      species: species ?? this.species,
      weaknesses: weaknesses ?? this.weaknesses,
      pokemonStats: pokemonStats ?? this.pokemonStats,
    );
  }

  String get heightFormatted {
    if (height == null || height == 0) return '';

    // meters
    final meters = height! / 10;

    // cm
    final cm = height! * 10;

    // feet + inches
    final totalInches = meters * 39.3701;
    final feet = totalInches ~/ 12;
    final inches = (totalInches % 12).round();

    // format meters
    final meterStr = meters.toStringAsFixed(
      meters % 1 == 0 ? 0 : 1,
    );

    // build imperial string
    final imperialStr = "$feet'$inches\"";

    if (height! >= 10) {
      // >= 1 meter
      return '$meterStr m ($imperialStr)';
    } else {
      // < 1 meter show cm + imperial
      return '$cm cm ($imperialStr)';
    }
  }

  double get weightInKg => (weight ?? 0) / 10;

  int get weightInGrams => (weight ?? 0) * 100;

  String get weightFormatted {
    if (weight == null || weight == 0) return '';

    final kg = weightInKg;
    final lbs = kg * 2.20462;

    // Format kg
    final kgStr = kg.toStringAsFixed(kg % 1 == 0 ? 0 : 1);

    // Format lbs
    final lbsStr = lbs.toStringAsFixed(lbs % 1 == 0 ? 0 : 1);

    if (weight! >= 10) {
      // >= 1kg  show kg + lbs
      return '$kgStr kg ($lbsStr lbs)';
    } else {
      // < 1kg  show grams + lbs
      final grams = weightInGrams;
      return '$grams g ($lbsStr lbs)';
    }
  }

  Map<String, int> mapStats() {
    final map = <String, int>{};
    if (pokemonStats != null) {
      for (var s in pokemonStats!) {
        final name = s.stat?.name ?? '';
        map[name] = s.baseStat ?? 0;
      }
    }

    return map;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
