import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';

class DexViewViewMobile extends StatelessWidget {
  const DexViewViewMobile({super.key, this.pokemonEntries = const []});

  final List<PokemonEntry> pokemonEntries;

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
      body: pokemonEntries.isEmpty
          ? const Center(
              child: Text(
                'No records found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: pokemonEntries.length,
              itemBuilder: (context, index) {
                final entry = pokemonEntries[index];
                final imageUrl = getImageUrl(entry.pokemonSpecies?.url);
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(entry.pokemonSpecies?.name ?? 'Unknown'),
                  ),
                );
              },
            ),
    );
  }
}
