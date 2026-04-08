import 'package:json_annotation/json_annotation.dart';

part 'version_groups.g.dart';

@JsonSerializable()
class VersionGroups {
  final String? name;
  final String? url;

  VersionGroups({this.name, this.url});

  factory VersionGroups.fromJson(Map<String, dynamic> json) => _$VersionGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupsToJson(this);
}
