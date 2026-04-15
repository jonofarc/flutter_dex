import 'package:flutter/material.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/type/data/models/type_chart.dart';

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

  static List<String> getWeaknessesByName(String name) {
    final typeChart = serviceLocator<TypeChart>();
    final types = typeChart.types;

    if (types.count <= 0) return [];

    final index = types.results.indexWhere(
      (t) => t.name.toLowerCase() == name.toLowerCase(),
    );

    if (index == -1) return [];

    final type = types.results[index];

    return type.typesDataDetails?.damageRelations.doubleDamageFrom.map((e) => e.name).toList() ?? [];
  }

  static List<String> getResistanceByName(String name) {
    final typeChart = serviceLocator<TypeChart>();
    final types = typeChart.types;

    if (types.count <= 0) return [];

    final index = types.results.indexWhere(
      (t) => t.name.toLowerCase() == name.toLowerCase(),
    );

    if (index == -1) return [];

    final type = types.results[index];

    return type.typesDataDetails?.damageRelations.halfDamageFrom.map((e) => e.name).toList() ?? [];
  }
}
