import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/helpers/l10n_extensions.dart';
import 'package:flutter_dex/helpers/string_extensions.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon/pokemon.dart';
import 'package:flutter_dex/poke_details/domain/mappers/pokemon_form_mapper.dart';
import 'package:flutter_dex/shared/utils/utils.dart';

class PokeDetailsViewMobile extends StatelessWidget {
  const PokeDetailsViewMobile({
    super.key,
    this.pokemon,
  });

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    final s = context.l10n;
    return Scaffold(
      appBar: AppBar(title: const Text('Dex View Selection')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemon?.pokemonForm?.imageUrl ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.capitalize(pokemon?.pokemonForm?.name ?? ""),
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 12),
                      Text(
                        pokemon?.species?.flavorTextEntries?.first.flavorText ?? "",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text(s.versions),
                          Icon(Icons.circle, color: Colors.blue, size: 14),
                          SizedBox(width: 8),
                          Icon(Icons.circle, color: Colors.red, size: 14),
                        ],
                      ),
                    ],
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
                    children: const [
                      Text("Gender"),
                      SizedBox(width: 8),
                      Icon(Icons.male),
                      SizedBox(width: 4),
                      Icon(Icons.female),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text("Stats Placeholder")),
            ),
            const SizedBox(height: 20),
            const Text("Type", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              children: pokemon?.pokemonForm?.types?.map((typeEntry) {
                    final typeName = typeEntry.type.name ?? "";

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
            const Text("Weaknesses", style: TextStyle(fontSize: 16)),
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
        Text(title, style: const TextStyle(color: Colors.white70)),
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
      ),
      child: Text(label.capitalize(), style: const TextStyle(color: Colors.white)),
    );
  }
}
