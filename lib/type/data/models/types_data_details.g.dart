// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_data_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesDataDetails _$TypesDataDetailsFromJson(Map<String, dynamic> json) =>
    TypesDataDetails(
      damageRelations: DamageRelations.fromJson(
          json['damage_relations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesDataDetailsToJson(TypesDataDetails instance) =>
    <String, dynamic>{
      'damage_relations': instance.damageRelations,
    };

DamageRelations _$DamageRelationsFromJson(Map<String, dynamic> json) =>
    DamageRelations(
      doubleDamageFrom: (json['double_damage_from'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      doubleDamageTo: (json['double_damage_to'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageFrom: (json['half_damage_from'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      halfDamageTo: (json['half_damage_to'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageFrom: (json['no_damage_from'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      noDamageTo: (json['no_damage_to'] as List<dynamic>)
          .map((e) => TypeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DamageRelationsToJson(DamageRelations instance) =>
    <String, dynamic>{
      'double_damage_from': instance.doubleDamageFrom,
      'double_damage_to': instance.doubleDamageTo,
      'half_damage_from': instance.halfDamageFrom,
      'half_damage_to': instance.halfDamageTo,
      'no_damage_from': instance.noDamageFrom,
      'no_damage_to': instance.noDamageTo,
    };

TypeRef _$TypeRefFromJson(Map<String, dynamic> json) => TypeRef(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeRefToJson(TypeRef instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
