import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokedex.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokemon_entry.dart';
import 'package:flutter_dex/dex_view/domain/usecases/get_dex_view_content.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';

part 'dex_view_event.dart';
part 'dex_view_state.dart';

class DexViewBloc extends Bloc<DexViewEvent, DexViewState> {
  final Region region;
  Pokedex? pokedex;

  DexViewBloc({required this.region}) : super(DexViewInitialState(region: region)) {
    on<LoadDexViewContent>(_onLoadDexViewContent);
  }

  void _onLoadDexViewContent(LoadDexViewContent event, Emitter<DexViewState> emit) async {
    final getDexViewContent = serviceLocator<GetDexViewContent>();

    if (state is DexViewLoading) {
      Log.debug("$runtimeType attempted to fetch data while loading");
      return;
    }

    emit(const DexViewLoading());
    Log.debug("fetching dex view content");

    try {
      final result = await getDexViewContent.getPokeDexData(url: region.url);

      result.fold(
        (error) => emit(DexViewError(message: error.message)),
        (pokedex) {
          this.pokedex = pokedex;
          emit(DexViewSuccess(pokemonEntries: pokedex.pokemonEntries));
        },
      );
    } catch (e) {
      Log.debug(e.toString());
      emit(DexViewError(message: e.toString()));
    }
  }
}
