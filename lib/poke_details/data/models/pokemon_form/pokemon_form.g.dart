// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonForm _$PokemonFormFromJson(Map<String, dynamic> json) => PokemonForm(
      form_name: json['form_name'] as String?,
      form_names: json['form_names'] as List<dynamic>?,
      form_order: (json['form_order'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      is_battle_only: json['is_battle_only'] as bool?,
      is_default: json['is_default'] as bool?,
      is_mega: json['is_mega'] as bool?,
      name: json['name'] as String?,
      names: json['names'] as List<dynamic>?,
      order: (json['order'] as num?)?.toInt(),
      pokemon: json['pokemon'] == null
          ? null
          : PokemonRef.fromJson(json['pokemon'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      version_group: json['version_group'] == null
          ? null
          : VersionGroup.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonFormToJson(PokemonForm instance) =>
    <String, dynamic>{
      'form_name': instance.form_name,
      'form_names': instance.form_names,
      'form_order': instance.form_order,
      'id': instance.id,
      'is_battle_only': instance.is_battle_only,
      'is_default': instance.is_default,
      'is_mega': instance.is_mega,
      'name': instance.name,
      'names': instance.names,
      'order': instance.order,
      'pokemon': instance.pokemon?.toJson(),
      'sprites': instance.sprites?.toJson(),
      'types': instance.types?.map((e) => e.toJson()).toList(),
      'version_group': instance.version_group?.toJson(),
    };
