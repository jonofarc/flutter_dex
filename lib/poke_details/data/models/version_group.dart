import 'package:json_annotation/json_annotation.dart';

part 'version_group.g.dart';

@JsonSerializable()
class VersionGroup {
  final String name;
  final String url;

  VersionGroup({
    required this.name,
    required this.url,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) => _$VersionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupToJson(this);
}
