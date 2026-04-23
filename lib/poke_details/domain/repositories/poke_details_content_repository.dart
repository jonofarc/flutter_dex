import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon/pokemon.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form/pokemon_form.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_species/pokemon_details_species.dart';
import 'package:flutter_dex/shared/network/failures.dart';
import 'package:flutter_dex/shared/utils/constants.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:http/http.dart' as http;

class PokeDetailsContentRepository {
  Future<Either<ServerFailure, PokemonForm>> getPokemonForm({required String id}) async {
    final url = pokeApiBaseUrl + pokemonFormUrl + id;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final pokemonForm = PokemonForm.fromJson(data);
          return Right(pokemonForm);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse pokemonForm for id $id: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }

  Future<Either<ServerFailure, PokemonDetailsSpecies>> getPokemonDetailsSpeciesData({required String id}) async {
    final url = pokeApiBaseUrl + pokemonSpeciesUrl + id;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final pokemonDetailsSpecies = PokemonDetailsSpecies.fromJson(data);
          return Right(pokemonDetailsSpecies);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse pokemonForm for id $id: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }

  Future<Either<ServerFailure, Pokemon>> getPokemonEntryData({required String id}) async {
    final url = pokeApiBaseUrl + pokemonUrl + id;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final pokemonDetails = Pokemon.fromJson(data);
          return Right(pokemonDetails);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse pokemonForm for id $id: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
