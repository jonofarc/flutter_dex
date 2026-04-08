// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokedex _$PokedexFromJson(Map<String, dynamic> json) => Pokedex(
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Descriptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      isMainSeries: json['is_main_series'] as bool?,
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Names.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonEntries: (json['pokemon_entries'] as List<dynamic>?)
          ?.map((e) => PokemonEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['region'] == null
          ? null
          : Language.fromJson(json['region'] as Map<String, dynamic>),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => VersionGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexToJson(Pokedex instance) => <String, dynamic>{
      'descriptions': instance.descriptions?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'is_main_series': instance.isMainSeries,
      'name': instance.name,
      'names': instance.names?.map((e) => e.toJson()).toList(),
      'pokemon_entries':
          instance.pokemonEntries?.map((e) => e.toJson()).toList(),
      'region': instance.region?.toJson(),
      'version_groups': instance.versionGroups?.map((e) => e.toJson()).toList(),
    };
