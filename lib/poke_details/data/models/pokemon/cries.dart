import 'package:json_annotation/json_annotation.dart';

part 'cries.g.dart';

@JsonSerializable()
class Cries {
  final String? latest;
  final String? legacy;

  const Cries({
    required this.latest,
    required this.legacy,
  });

  factory Cries.fromJson(Map<String, dynamic> json) => _$CriesFromJson(json);

  Map<String, dynamic> toJson() => _$CriesToJson(this);
}
