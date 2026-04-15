// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => TypeResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

TypeResult _$TypeResultFromJson(Map<String, dynamic> json) => TypeResult(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeResultToJson(TypeResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
