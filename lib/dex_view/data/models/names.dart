import 'package:flutter_dex/dex_view/data/models/locations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'names.g.dart';

@JsonSerializable(explicitToJson: true)
class Names {
  Locations? language;
  String? name;

  Names({this.language, this.name});

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}
