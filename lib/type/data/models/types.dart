import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable()
class Types {
  final int count;
  final String? next;
  final String? previous;
  final List<TypeResult> results;

  Types({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class TypeResult {
  final String name;
  final String url;

  TypeResult({
    required this.name,
    required this.url,
  });

  factory TypeResult.fromJson(Map<String, dynamic> json) => _$TypeResultFromJson(json);

  Map<String, dynamic> toJson() => _$TypeResultToJson(this);
}
