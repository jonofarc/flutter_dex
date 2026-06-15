import 'package:flutter_dex/dex_view/data/models/pokedex/language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entry.g.dart';

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;

  @JsonKey(name: 'language')
  final Language? language;

  FlavorTextEntry({
    this.flavorText,
    this.language,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}
