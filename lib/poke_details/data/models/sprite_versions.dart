import 'package:json_annotation/json_annotation.dart';

import 'generation_ix.dart';
import 'generation_viii.dart';

part 'sprite_versions.g.dart';

@JsonSerializable(explicitToJson: true)
class SpriteVersions {
  @JsonKey(name: 'generation-ix')
  final GenerationIX? generationIx;

  @JsonKey(name: 'generation-viii')
  final GenerationVIII? generationViii;

  SpriteVersions({
    this.generationIx,
    this.generationViii,
  });

  factory SpriteVersions.fromJson(Map<String, dynamic> json) => _$SpriteVersionsFromJson(json);

  Map<String, dynamic> toJson() => _$SpriteVersionsToJson(this);
}
