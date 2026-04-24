import 'package:json_annotation/json_annotation.dart';

part 'bdsp.g.dart';

@JsonSerializable()
class BDSP {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  BDSP({
    this.frontDefault,
    this.frontFemale,
  });

  factory BDSP.fromJson(Map<String, dynamic> json) => _$BDSPFromJson(json);

  Map<String, dynamic> toJson() => _$BDSPToJson(this);
}
