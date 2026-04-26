import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stat.g.dart';

@JsonSerializable()
class PokemonStat {
  @JsonKey(name: 'base_stat')
  final int? baseStat;

  final int? effort;
  final StatInfo? stat;

  PokemonStat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

@JsonSerializable()
class StatInfo {
  final String? name;
  final String? url;

  StatInfo({
    this.name,
    this.url,
  });

  factory StatInfo.fromJson(Map<String, dynamic> json) => _$StatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StatInfoToJson(this);
}
