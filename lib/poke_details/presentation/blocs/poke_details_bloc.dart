import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon/pokemon.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form/pokemon_form.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_species/pokemon_details_species.dart';
import 'package:flutter_dex/poke_details/domain/usecases/poke_details_view_content.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:flutter_dex/shared/utils/utils.dart';

part 'poke_details_event.dart';
part 'poke_details_state.dart';

class PokeDetailsBloc extends Bloc<PokeDetailsEvent, PokeDetailsState> {
  final String id;
  PokemonForm? pokemonForm;
  PokemonDetailsSpecies? species;
  Pokemon? pokemon;

  PokeDetailsBloc({required this.id}) : super(PokeDetailsInitialState(id: id)) {
    on<LoadPokeDetailsContent>(_onLoadPokeDetailsContent);
  }

  void _onLoadPokeDetailsContent(LoadPokeDetailsContent event, Emitter<PokeDetailsState> emit) async {
    final getPokeDetailsContent = serviceLocator<GetPokeDetailsContent>();

    if (state is PokeDetailsLoading) {
      Log.debug("$runtimeType attempted to fetch data while loading");
      return;
    }

    emit(const PokeDetailsLoading());
    Log.debug("fetching dex view content");

    try {
      final pokedexData = await getPokeDetailsContent.getPokeDexData(id: id);

      final pokemonSpeciesData = await getPokeDetailsContent.getPokemonDetailsSpeciesData(id: id);

      final pokemonData = await getPokeDetailsContent.getPokemonEntryData(id: id);

      pokedexData.fold(
        (error) => emit(PokeDetailsError(message: error.message)),
        (pokemonForm) {
          pokemonSpeciesData.fold(
            (error) => emit(PokeDetailsError(message: error.message)),
            (species) {
              pokemonData.fold(
                (error) => emit(PokeDetailsError(message: error.message)),
                (pokemon) {
                  this.pokemonForm = pokemonForm;
                  this.species = species;
                  this.pokemon = pokemon;

                  final pokemonTypes = pokemonForm.types ?? [];

                  final weaknesses = pokemonTypes
                      .map((typeEntry) {
                        final typeName = typeEntry.type.name;
                        return Utils.getWeaknessesByName(typeName);
                      })
                      .expand((list) => list)
                      .toSet();

                  final resistances = pokemonTypes
                      .map((typeEntry) {
                        final typeName = typeEntry.type.name;
                        return Utils.getResistanceByName(typeName);
                      })
                      .expand((list) => list)
                      .toSet();

                  List<String> finalWeaknesses = weaknesses.difference(resistances).toList();

                  pokemon = pokemon.copyWith(
                    pokemonForm: pokemonForm,
                    species: species,
                    weaknesses: finalWeaknesses,
                  );

                  emit(PokeDetailsSuccess(
                    pokemon: pokemon,
                  ));
                },
              );
            },
          );
        },
      );
    } catch (e) {
      Log.debug(e.toString());
      emit(PokeDetailsError(message: e.toString()));
    }
  }
}
