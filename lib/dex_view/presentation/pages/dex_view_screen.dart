import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';

class DexViewScreen extends StatelessWidget {
  DexViewScreen({super.key, required this.region});


  Region region;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${region.name} Selection'),
      ),
      body: Center(
        child: Text('${region.name} list goes here')
      ),
    );
  }
}