import 'package:json_annotation/json_annotation.dart';

import 'bdsp.dart';

part 'generation_viii.g.dart';

@JsonSerializable()
class GenerationVIII {
  @JsonKey(name: 'brilliant-diamond-shining-pearl')
  final BDSP? brilliantDiamondShiningPearl;

  GenerationVIII({
    this.brilliantDiamondShiningPearl,
  });

  factory GenerationVIII.fromJson(Map<String, dynamic> json) => _$GenerationVIIIFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationVIIIToJson(this);
}
