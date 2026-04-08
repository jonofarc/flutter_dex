import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';

class DexViewViewMobile extends StatelessWidget {
  const DexViewViewMobile({super.key, this.pokemonEntries = const []});

  final List<PokemonEntry> pokemonEntries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dex View Selection'),
      ),
      body: pokemonEntries.isEmpty
          ? const Center(
              child: Text(
                'No records found error ocurred',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: pokemonEntries.length,
              itemBuilder: (context, index) {
                final entry = pokemonEntries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(entry.entryNumber?.toString() ?? '#'),
                    ),
                    title: Text(entry.pokemonSpecies?.name ?? 'Unknown'),
                  ),
                );
              },
            ),
    );
  }
}
