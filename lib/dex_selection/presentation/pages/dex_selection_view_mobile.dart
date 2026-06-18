import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/dex_view/presentation/pages/dex_view_screen.dart';
import 'package:flutter_dex/helpers/string_extensions.dart';
import 'package:flutter_dex/shared/widget/dex_app_bar.dart';
import 'package:flutter_dex/shared/widget/dex_background.dart';
import 'package:flutter_dex/shared/widget/outlined_text.dart';

class DexSelectionViewMobile extends StatelessWidget {
  const DexSelectionViewMobile({
    super.key,
    this.regions = const Regions(count: 0, results: []),
  });

  final Regions regions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DexAppBar(
        title: "Dex Selection",
      ),
      body: DexBackground(
        child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: regions.results.length,
            itemBuilder: (context, index) {
              final region = regions.results[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 3,
                  clipBehavior: Clip.antiAlias, // Ensures ripple stays within card bounds
                  child: InkWell(
                    onTap: () => _navigateToRegion(
                      context: context,
                      region: region,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/img/PokeRegions/${region.name.capitalize()}.jpg',
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(height: 8),
                          OutlinedText(
                            region.name.capitalize(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            outlineColor: const Color(0xFF3561AD),
                            outlineStrokeWeight: 5.0,
                            style: const TextStyle(
                              color: Color(0xFFFFCB08),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _navigateToRegion({
    required BuildContext context,
    required Region region,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return DexViewScreen(region: region);
        },
      ),
    );
  }
}
