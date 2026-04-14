import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/poke_details/data/models/pokemon_form.dart';
import 'package:flutter_dex/poke_details/domain/usecases/poke_details_view_content.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';

part 'poke_details_event.dart';
part 'poke_details_state.dart';

class PokeDetailsBloc extends Bloc<PokeDetailsEvent, PokeDetailsState> {
  final String id;
  PokemonForm? pokemonForm;

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
      final result = await getPokeDetailsContent.getPokeDexData(id: id);

      result.fold(
        (error) => emit(PokeDetailsError(message: error.message)),
        (pokemonForm) {
          this.pokemonForm = pokemonForm;
          emit(PokeDetailsSuccess(pokemonForm: pokemonForm));
        },
      );
    } catch (e) {
      Log.debug(e.toString());
      emit(PokeDetailsError(message: e.toString()));
    }
  }
}
