// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Names _$NamesFromJson(Map<String, dynamic> json) => Names(
      language: json['language'] == null
          ? null
          : Locations.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'language': instance.language?.toJson(),
      'name': instance.name,
    };
