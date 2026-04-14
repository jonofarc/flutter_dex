import 'package:json_annotation/json_annotation.dart';

part 'bdsp.g.dart';

@JsonSerializable()
class BDSP {
  final String? front_default;
  final String? front_female;

  BDSP({
    this.front_default,
    this.front_female,
  });

  factory BDSP.fromJson(Map<String, dynamic> json) => _$BDSPFromJson(json);

  Map<String, dynamic> toJson() => _$BDSPToJson(this);
}
