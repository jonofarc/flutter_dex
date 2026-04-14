import 'package:flutter_dex/poke_details/data/models/pokemon_type_slot.dart';
import 'package:flutter_dex/poke_details/data/models/version_group.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pokemon_ref.dart';
import 'sprites.dart';

part 'pokemon_form.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonForm {
  final String? form_name;
  final List<dynamic>? form_names;
  final int? form_order;
  final int? id;
  final bool? is_battle_only;
  final bool? is_default;
  final bool? is_mega;
  final String? name;
  final List<dynamic>? names;
  final int? order;
  final PokemonRef? pokemon;
  final Sprites? sprites;
  final List<PokemonTypeSlot>? types;
  final VersionGroup? version_group;

  PokemonForm({
    this.form_name,
    this.form_names,
    this.form_order,
    this.id,
    this.is_battle_only,
    this.is_default,
    this.is_mega,
    this.name,
    this.names,
    this.order,
    this.pokemon,
    this.sprites,
    this.types,
    this.version_group,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) => _$PokemonFormFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormToJson(this);
}
