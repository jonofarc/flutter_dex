import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';
import 'package:flutter_dex/dex_view/domain/mappers/pokemon_entry_mapper.dart';
import 'package:flutter_dex/helpers/l10n_extensions.dart';
import 'package:flutter_dex/poke_details/presentation/pages/poke_details_screen.dart';
import 'package:flutter_dex/shared/widget/dex_app_bar.dart';
import 'package:flutter_dex/shared/widget/dex_background.dart';

class DexViewViewMobile extends StatelessWidget {
  const DexViewViewMobile({super.key, this.pokemonEntries = const []});

  final List<PokemonEntry> pokemonEntries;

  @override
  Widget build(BuildContext context) {
    final s = context.l10n;
    return Scaffold(
      appBar: DexAppBar(
        title: s.dexViewScreenTitle,
      ),
      body: pokemonEntries.isEmpty
          ? Center(
              child: Text(
                s.noRecordsFound,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : DexBackground(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: pokemonEntries.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final entry = pokemonEntries[index];
                  final imageUrl = entry.imageUrl;

                  return Card(
                    elevation: 3,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => _pokemonTapped(
                        context: context,
                        entry: entry,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: imageUrl,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              entry.pokemonSpecies?.name ?? s.unknown,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
