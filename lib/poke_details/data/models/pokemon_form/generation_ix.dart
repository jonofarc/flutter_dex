import 'package:json_annotation/json_annotation.dart';

import 'scarlet_violet.dart';

part 'generation_ix.g.dart';

@JsonSerializable(explicitToJson: true)
class GenerationIX {
  @JsonKey(name: 'scarlet-violet')
  final ScarletViolet? scarletViolet;

  GenerationIX({this.scarletViolet});

  factory GenerationIX.fromJson(Map<String, dynamic> json) => _$GenerationIXFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIXToJson(this);
}
