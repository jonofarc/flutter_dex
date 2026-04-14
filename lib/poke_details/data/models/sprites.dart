import 'package:json_annotation/json_annotation.dart';

import 'sprite_versions.dart';

part 'sprites.g.dart';

@JsonSerializable(explicitToJson: true)
class Sprites {
  final String? back_default;
  final String? back_female;
  final String? back_shiny;
  final String? back_shiny_female;
  final String? front_default;
  final String? front_female;
  final String? front_shiny;
  final String? front_shiny_female;
  final SpriteVersions? versions;

  Sprites({
    this.back_default,
    this.back_female,
    this.back_shiny,
    this.back_shiny_female,
    this.front_default,
    this.front_female,
    this.front_shiny,
    this.front_shiny_female,
    this.versions,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
