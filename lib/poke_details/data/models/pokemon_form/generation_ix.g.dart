// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_ix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationIX _$GenerationIXFromJson(Map<String, dynamic> json) => GenerationIX(
      scarletViolet: json['scarlet-violet'] == null
          ? null
          : ScarletViolet.fromJson(
              json['scarlet-violet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIXToJson(GenerationIX instance) =>
    <String, dynamic>{
      'scarlet-violet': instance.scarletViolet?.toJson(),
    };
