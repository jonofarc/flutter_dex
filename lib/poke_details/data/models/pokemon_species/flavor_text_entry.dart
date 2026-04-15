import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entry.g.dart';

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;

  FlavorTextEntry({
    this.flavorText,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}
