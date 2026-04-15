import 'package:dartz/dartz.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form/pokemon_form.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_species/pokemon_details_species.dart';
import 'package:flutter_dex/poke_details/domain/repositories/poke_details_content_repository.dart';
import 'package:flutter_dex/shared/network/failures.dart';

class GetPokeDetailsContent {
  GetPokeDetailsContent();

  Future<Either<ServerFailure, PokemonForm>> getPokeDexData({required String id}) async {
    return await PokeDetailsContentRepository().getPokemonForm(id: id);
  }

  Future<Either<ServerFailure, PokemonDetailsSpecies>> getPokemonDetailsSpeciesData({required String id}) async {
    return await PokeDetailsContentRepository().getPokemonDetailsSpeciesData(id: id);
  }
}
