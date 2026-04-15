// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsSpecies _$PokemonDetailsSpeciesFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsSpecies(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailsSpeciesToJson(
        PokemonDetailsSpecies instance) =>
    <String, dynamic>{
      'flavor_text_entries':
          instance.flavorTextEntries?.map((e) => e.toJson()).toList(),
    };
