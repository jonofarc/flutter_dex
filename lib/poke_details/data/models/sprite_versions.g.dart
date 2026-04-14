// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprite_versions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpriteVersions _$SpriteVersionsFromJson(Map<String, dynamic> json) =>
    SpriteVersions(
      generationIx: json['generation-ix'] == null
          ? null
          : GenerationIX.fromJson(
              json['generation-ix'] as Map<String, dynamic>),
      generationViii: json['generation-viii'] == null
          ? null
          : GenerationVIII.fromJson(
              json['generation-viii'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpriteVersionsToJson(SpriteVersions instance) =>
    <String, dynamic>{
      'generation-ix': instance.generationIx?.toJson(),
      'generation-viii': instance.generationViii?.toJson(),
    };
