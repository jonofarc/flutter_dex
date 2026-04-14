import 'package:flutter/material.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form.dart';

class PokeDetailsViewMobile extends StatelessWidget {
  const PokeDetailsViewMobile({super.key, this.pokemonForm});

  final PokemonForm? pokemonForm;

  String getImageUrl(String? url) {
    String id = url?.split('/').where((e) => e.isNotEmpty).last ?? "";

    if (id.trim().isNotEmpty) {
      // Using PokeAPI sprites for consistency
      return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    } else {
      // empty placeholder image
      return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dex View Selection')),
      body: Center(
        child: Text(
          pokemonForm?.name ?? "no pokemon Selected",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
