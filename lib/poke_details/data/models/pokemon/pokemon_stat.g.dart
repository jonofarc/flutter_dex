// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      baseStat: (json['base_stat'] as num?)?.toInt(),
      effort: (json['effort'] as num?)?.toInt(),
      stat: json['stat'] == null
          ? null
          : StatInfo.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) => StatInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StatInfoToJson(StatInfo instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
