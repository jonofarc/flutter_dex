import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/helpers/l10n_extensions.dart';
import 'package:flutter_dex/helpers/string_extensions.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon/pokemon.dart';
import 'package:flutter_dex/poke_details/domain/mappers/pokemon_form_mapper.dart';
import 'package:flutter_dex/shared/utils/utils.dart';
import 'package:flutter_dex/shared/widget/dex_app_bar.dart';
import 'package:flutter_dex/shared/widget/dex_background.dart';

class PokeDetailsViewMobile extends StatelessWidget {
  const PokeDetailsViewMobile({
    super.key,
    this.pokemon,
  });

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    final s = context.l10n;

    final double containerWidth = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      appBar: DexAppBar(
        title: "Details",
      ),
      body: DexBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: containerWidth.clamp(0, 120),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemon?.pokemonForm?.imageUrl ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.blue.shade400,
                      margin: const EdgeInsets.all(0),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: containerWidth.clamp(0, 120),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon?.pokemonForm?.name?.capitalize() ?? "",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                pokemon?.species?.getFlavorTextEntry(context) ?? "",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              //this elevated button to the bottom of the card
                              ElevatedButton(
                                onPressed: () {
                                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                                    Utils.playSoundStream(
                                      pokemon?.cries?.legacy ?? pokemon?.cries?.latest,
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(s.cry),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoItem(title: s.height, value: pokemon?.heightFormatted ?? ""),
                        _InfoItem(title: s.weight, value: pokemon?.weightFormatted ?? ""),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          s.gender,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        ...?pokemon?.species?.getGenderList().map(
                              (icon) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  icon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: _buildPokemonStats(context)),
              ),
              const SizedBox(height: 20),
              Text(s.type, style: TextStyle(fontSize: 16, color: Colors.white)),
              const SizedBox(height: 10),
              Row(
                children: pokemon?.pokemonForm?.types?.map((typeEntry) {
                      final typeName = typeEntry.type.getTypeText(s);

                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: _Chip(
                          label: typeName,
                          color: Utils.getTypeColor(typeName),
                        ),
                      );
                    }).toList() ??
                    [],
              ),
              const SizedBox(height: 20),
              Text(s.weaknesses, style: TextStyle(fontSize: 16, color: Colors.white)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: (pokemon?.weaknesses ?? []).map((weakness) {
                  return _Chip(
                    label: weakness,
                    color: Utils.getTypeColor(weakness),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn({
    required String label,
    required int value,
    int maxValue = 255,
  }) {
    int numberOfBars = 15;
    final filledBars = ((value * numberOfBars) / maxValue).round();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(numberOfBars, (index) {
                  final isFilled = index < filledBars;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    height: 6,
                    color: isFilled ? Colors.blue : Colors.grey[300],
                  );
                }).reversed.toList(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonStats(BuildContext context) {
    final s = context.l10n;
    final stats = pokemon?.pokemonStats ?? [];

    final statMap = pokemon?.mapStats() ?? {};

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.baseStats, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: stats.map((s) {
              final name = s.stat?.name ?? '';

              return _buildStatColumn(
                label: name.capitalize(),
                value: statMap[name] ?? 0,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;

  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        label.capitalize(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
