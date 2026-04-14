import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';
import 'package:flutter_dex/dex_view/domain/mappers/pokemon_entry_mapper.dart';
import 'package:flutter_dex/poke_details/presentation/pages/poke_details_screen.dart';

class DexViewViewMobile extends StatelessWidget {
  const DexViewViewMobile({super.key, this.pokemonEntries = const []});

  final List<PokemonEntry> pokemonEntries;

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
                final imageUrl = entry.imageUrl;
                return GestureDetector(
                  onTap: () => _pokemonTapped(
                    context: context,
                    entry: entry,
                  ),
                  child: Card(
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
                  ),
                );
              },
            ),
    );
  }

  _pokemonTapped({
    required BuildContext context,
    required PokemonEntry entry,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PokeDetailsScreen(
          id: entry.pokemonId,
        ),
      ),
    );
  }
}
