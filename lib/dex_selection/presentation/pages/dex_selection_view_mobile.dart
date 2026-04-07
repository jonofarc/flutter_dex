import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/dex_view/presentation/pages/dex_view_screen.dart';

class DexSelectionViewMobile extends StatelessWidget {
  const DexSelectionViewMobile({
    super.key, this.regions = const Regions(count: 0, results: []),
  });

  final Regions regions;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dex Selection'),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: regions.results.length,
          itemBuilder: (context, index) {
            final region = regions.results[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () => _navigateToRegion(context: context, region: region),
                child: Text(region.name),
              ),
            );
          },
        ),
      ),
    );
  }


  _navigateToRegion({required BuildContext context, required Region region}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return DexViewScreen(region: region);
          },
        ),
      );
    });
  }

}