import 'package:json_annotation/json_annotation.dart';

part 'types_data_details.g.dart';

@JsonSerializable()
class TypesDataDetails {
  @JsonKey(name: 'damage_relations')
  final DamageRelations damageRelations;

  TypesDataDetails({
    required this.damageRelations,
  });

  factory TypesDataDetails.fromJson(Map<String, dynamic> json) => _$TypesDataDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TypesDataDetailsToJson(this);
}

@JsonSerializable()
class DamageRelations {
  @JsonKey(name: 'double_damage_from')
  final List<TypeRef> doubleDamageFrom;

  @JsonKey(name: 'double_damage_to')
  final List<TypeRef> doubleDamageTo;

  @JsonKey(name: 'half_damage_from')
  final List<TypeRef> halfDamageFrom;

  @JsonKey(name: 'half_damage_to')
  final List<TypeRef> halfDamageTo;

  @JsonKey(name: 'no_damage_from')
  final List<TypeRef> noDamageFrom;

  @JsonKey(name: 'no_damage_to')
  final List<TypeRef> noDamageTo;

  DamageRelations({
    required this.doubleDamageFrom,
    required this.doubleDamageTo,
    required this.halfDamageFrom,
    required this.halfDamageTo,
    required this.noDamageFrom,
    required this.noDamageTo,
  });

  factory DamageRelations.fromJson(Map<String, dynamic> json) => _$DamageRelationsFromJson(json);

  Map<String, dynamic> toJson() => _$DamageRelationsToJson(this);
}

@JsonSerializable()
class TypeRef {
  final String name;
  final String url;

  TypeRef({
    required this.name,
    required this.url,
  });

  factory TypeRef.fromJson(Map<String, dynamic> json) => _$TypeRefFromJson(json);

  Map<String, dynamic> toJson() => _$TypeRefToJson(this);
}
