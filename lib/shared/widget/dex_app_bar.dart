import 'package:flutter/material.dart';

class DexAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DexAppBar({
    super.key,
    this.title = 'Dex Selection',
    this.colors,
  });
  final String title;
  final List<Color>? colors;
  @override
  Widget build(BuildContext context) {
    final gradientColors = colors ??
        const [
          Color(0xFFE53935), // deep red
          Color(0xFFEF5350), // lighter red
        ];
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          shadows: [
            Shadow(
              blurRadius: 6,
              color: Colors.black45,
              offset: Offset(1, 1),
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // back arrow color
      ),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
