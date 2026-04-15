import 'package:flutter/material.dart';

class Utils {
  static String capitalize(String? text) {
    if (text == null || text.isEmpty) return "";
    return text[0].toUpperCase() + text.substring(1);
  }

  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case "grass":
        return Colors.green;
      case "poison":
        return Colors.purple;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "electric":
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
