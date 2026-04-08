import 'package:flutter_dex/dex_view/data/models/locations.dart';
import 'package:flutter_dex/dex_view/data/models/names.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/version_groups.dart';
import 'package:flutter_dex/dex_view/data/models/pokedexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_info.g.dart';

@JsonSerializable(explicitToJson: true)
class RegionInfo {
  int? id;
  List<Locations>? locations;

  @JsonKey(name: 'main_generation')
  Locations? mainGeneration;

  String? name;
  List<Names>? names;
  List<Pokedexes>? pokedexes;

  @JsonKey(name: 'version_groups')
  List<VersionGroups>? versionGroups;

  RegionInfo({
    this.id,
    this.locations,
    this.mainGeneration,
    this.name,
    this.names,
    this.pokedexes,
    this.versionGroups,
  });

  factory RegionInfo.fromJson(Map<String, dynamic> json) => _$RegionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RegionInfoToJson(this);
}
