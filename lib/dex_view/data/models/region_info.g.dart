// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionInfo _$RegionInfoFromJson(Map<String, dynamic> json) => RegionInfo(
      id: (json['id'] as num?)?.toInt(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Locations.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainGeneration: json['main_generation'] == null
          ? null
          : Locations.fromJson(json['main_generation'] as Map<String, dynamic>),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Names.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexes: (json['pokedexes'] as List<dynamic>?)
          ?.map((e) => Pokedexes.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => VersionGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionInfoToJson(RegionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
      'main_generation': instance.mainGeneration?.toJson(),
      'name': instance.name,
      'names': instance.names?.map((e) => e.toJson()).toList(),
      'pokedexes': instance.pokedexes?.map((e) => e.toJson()).toList(),
      'version_groups': instance.versionGroups?.map((e) => e.toJson()).toList(),
    };
