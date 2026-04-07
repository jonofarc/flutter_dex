import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_view/presentation/pages/dex_view_screen.dart';

class DexSelectionViewMobile extends StatelessWidget {
  const DexSelectionViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dex Selection'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateToRegion(context: context);
          },
          child: const Text('kanto'),
        ),
      ),
    );
  }


  _navigateToRegion({required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const DexViewScreen();
          },
        ),
      );
    });
  }

}