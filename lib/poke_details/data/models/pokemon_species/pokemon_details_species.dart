import 'package:flutter/material.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_species/flavor_text_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_species.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonDetailsSpecies {
  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorTextEntry>? flavorTextEntries;

  @JsonKey(name: 'gender_rate')
  final int? genderRate;

  PokemonDetailsSpecies({
    this.flavorTextEntries,
    this.genderRate,
  });

  factory PokemonDetailsSpecies.fromJson(Map<String, dynamic> json) => _$PokemonDetailsSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsSpeciesToJson(this);

  FlavorTextEntry? getFlavorTextEntryByLanguage(String? languageName) {
    if (flavorTextEntries != null) {
      for (final flavorTextEntry in flavorTextEntries!) {
        if (flavorTextEntry.language?.name == languageName) {
          return flavorTextEntry;
        }
      }
    }

    return null;
  }

  List<IconData> getGenderList() {
    genderRate;

    if (genderRate == null) {
      return [Icons.help_outline]; // gender is null
    }

    if (genderRate == -1) {
      return [Icons.block]; // genderless
    }

    final List<IconData> icons = [];

    if ((genderRate ?? -1) > 0) {
      icons.add(Icons.female); //only female
    }

    if ((genderRate ?? -1) < 8) {
      icons.add(Icons.male); //only male
    }

    return icons;
  }
}
