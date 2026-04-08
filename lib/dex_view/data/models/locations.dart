import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable()
class Locations {
  String? name;
  String? url;

  Locations({this.name, this.url});

  factory Locations.fromJson(Map<String, dynamic> json) => _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}
