import 'package:flutter/material.dart';

class DexBackground extends StatelessWidget {
  final Widget child;

  const DexBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE53935), // deep red
            Color(0xFFEF5350), // lighter red
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // big faded circle (top right)
          Positioned(
            top: -60,
            right: -60,
            child: _circle(180),
          ),

          // medium faded circle (bottom left)
          Positioned(
            bottom: -80,
            left: -80,
            child: _circle(220),
          ),

          // small accent circle
          Positioned(
            top: 120,
            right: 30,
            child: _circle(90, opacity: 0.08),
          ),

          // your actual UI
          SafeArea(child: child),
        ],
      ),
    );
  }

  Widget _circle(double size, {double opacity = 0.12}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
        border: Border.all(
          color: Colors.white.withOpacity(opacity + 0.1),
          width: 2,
        ),
      ),
    );
  }
}
