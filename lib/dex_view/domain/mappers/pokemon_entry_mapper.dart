import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';

extension PokemonEntryMapper on PokemonEntry {
  String get imageUrl {
    final id = pokemonSpecies?.url?.split('/').where((e) => e.isNotEmpty).last ?? "0";

    return id.trim().isNotEmpty
        ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'
        : 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png';
  }

  String get pokemonId {
    return pokemonSpecies?.url?.split('/').where((e) => e.isNotEmpty).last ?? "0";
  }
}
