import 'package:flutter_dex/dex_view/data/models/pokedex/language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'descriptions.g.dart';

@JsonSerializable(explicitToJson: true)
class Descriptions {
  final String? description;
  final Language? language;

  Descriptions({this.description, this.language});

  factory Descriptions.fromJson(Map<String, dynamic> json) => _$DescriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionsToJson(this);
}
