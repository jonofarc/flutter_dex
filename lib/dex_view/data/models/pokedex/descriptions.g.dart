// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Descriptions _$DescriptionsFromJson(Map<String, dynamic> json) => Descriptions(
      description: json['description'] as String?,
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescriptionsToJson(Descriptions instance) =>
    <String, dynamic>{
      'description': instance.description,
      'language': instance.language?.toJson(),
    };
