import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:json_annotation/json_annotation.dart';

part 'regions.g.dart';

@JsonSerializable()
class Regions {
  final int count;
  final String? next;
  final String? previous;
  final List<Region> results;

  const Regions({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => _$RegionsFromJson(json);

  Map<String, dynamic> toJson() => _$RegionsToJson(this);
}
