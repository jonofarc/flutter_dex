// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };
