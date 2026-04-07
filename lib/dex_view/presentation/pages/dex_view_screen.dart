import 'package:flutter/material.dart';

class DexViewScreen extends StatelessWidget {
  const DexViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dex Selection'),
      ),
      body: Center(
        child: const Text('region list goes here')
      ),
    );
  }
}