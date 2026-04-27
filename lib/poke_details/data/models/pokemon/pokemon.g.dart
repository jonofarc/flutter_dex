// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      isDefault: json['is_default'] as bool?,
      pokemonForm: json['pokemon_form'] == null
          ? null
          : PokemonForm.fromJson(json['pokemon_form'] as Map<String, dynamic>),
      species: json['species'] == null
          ? null
          : PokemonDetailsSpecies.fromJson(
              json['species'] as Map<String, dynamic>),
      pokemonStats: (json['stats'] as List<dynamic>?)
          ?.map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cries: json['cries'] == null
          ? null
          : Cries.fromJson(json['cries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'id': instance.id,
      'is_default': instance.isDefault,
      'pokemon_form': instance.pokemonForm,
      'species': instance.species,
      'weaknesses': instance.weaknesses,
      'stats': instance.pokemonStats,
      'cries': instance.cries,
    };
