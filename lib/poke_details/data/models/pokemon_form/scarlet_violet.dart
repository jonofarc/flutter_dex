import 'package:json_annotation/json_annotation.dart';

part 'scarlet_violet.g.dart';

@JsonSerializable()
class ScarletViolet {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  ScarletViolet({
    this.frontDefault,
    this.frontFemale,
  });

  factory ScarletViolet.fromJson(Map<String, dynamic> json) => _$ScarletVioletFromJson(json);

  Map<String, dynamic> toJson() => _$ScarletVioletToJson(this);
}
