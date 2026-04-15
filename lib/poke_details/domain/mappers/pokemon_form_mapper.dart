import 'package:flutter_dex/poke_details/data/models/pokemon_form/pokemon_form.dart';

extension PokemonFormMapper on PokemonForm {
  String get imageUrl {
    final id = pokemon?.url?.split('/').where((e) => e.isNotEmpty).last ?? "0";

    return id.trim().isNotEmpty
        ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'
        : 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png';
  }

  String get pokemonId {
    return pokemon?.url?.split('/').where((e) => e.isNotEmpty).last ?? "0";
  }
}
