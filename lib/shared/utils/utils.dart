import 'package:flutter/material.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:flutter_dex/type/data/models/type_chart.dart';
import 'package:just_audio/just_audio.dart';

final AudioPlayer player = AudioPlayer();

class Utils {
  static Future<void> playSoundStream(String? url) async {
    if (url != null) {
      try {
        await player.stop();
        await player.setUrl(url);
        await player.play();
      } catch (e) {
        Log.error("playSoundStream  with url $url error: $e");
      }
    }
  }

  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case "normal":
        return Colors.grey;

      case "fire":
        return Colors.deepOrange;

      case "water":
        return Colors.blue;

      case "electric":
        return Colors.amber;

      case "grass":
        return Colors.green;

      case "ice":
        return Colors.lightBlueAccent;

      case "fighting":
        return Colors.brown;

      case "poison":
        return Colors.purple;

      case "ground":
        return Colors.orangeAccent;

      case "flying":
        return Colors.indigoAccent;

      case "psychic":
        return Colors.pink;

      case "bug":
        return Colors.lightGreen;

      case "rock":
        return Colors.brown.shade600;

      case "ghost":
        return Colors.deepPurple;

      case "dragon":
        return Colors.indigo;

      case "dark":
        return Colors.black87;

      case "steel":
        return Colors.blueGrey;

      case "fairy":
        return Colors.pinkAccent;

      case "stellar":
        return Colors.tealAccent;

      case "unknown":
        return Colors.grey;

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
