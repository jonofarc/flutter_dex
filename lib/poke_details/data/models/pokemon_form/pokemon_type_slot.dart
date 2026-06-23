import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type_slot.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonTypeSlot {
  final int slot;
  final PokemonType type;

  PokemonTypeSlot({
    required this.slot,
    required this.type,
  });

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) => _$PokemonTypeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeSlotToJson(this);
}

@JsonSerializable()
class PokemonType {
  final String name;
  final String url;

  PokemonType({
    required this.name,
    required this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);

  String getTypeText(AppLocalizations s) {
    switch (name.toLowerCase()) {
      case "normal":
        return s.typeNormal;
      case "fire":
        return s.typeFire;
      case "water":
        return s.typeWater;
      case "electric":
        return s.typeElectric;
      case "grass":
        return s.typeGrass;
      case "ice":
        return s.typeIce;
      case "fighting":
        return s.typeFighting;
      case "poison":
        return s.typePoison;
      case "ground":
        return s.typeGround;
      case "flying":
        return s.typeFlying;
      case "psychic":
        return s.typePsychic;
      case "bug":
        return s.typeBug;
      case "rock":
        return s.typeRock;
      case "ghost":
        return s.typeGhost;
      case "dragon":
        return s.typeDragon;
      case "dark":
        return s.typeDark;
      case "steel":
        return s.typeSteel;
      case "fairy":
        return s.typeFairy;
      default:
        return name;
    }
  }
}
