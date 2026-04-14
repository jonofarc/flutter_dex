import 'package:json_annotation/json_annotation.dart';

part 'scarlet_violet.g.dart';

@JsonSerializable()
class ScarletViolet {
  final String? front_default;
  final String? front_female;

  ScarletViolet({
    this.front_default,
    this.front_female,
  });

  factory ScarletViolet.fromJson(Map<String, dynamic> json) => _$ScarletVioletFromJson(json);

  Map<String, dynamic> toJson() => _$ScarletVioletToJson(this);
}
