import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/dex_selection/domain/usecases/get_home_content.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';


part 'dex_selection_event.dart';

part 'dex_selection_state.dart';

class DexSelectionBloc extends Bloc<DexSelectionEvent, DexSelectionState> {
  DexSelectionBloc() : super(const DexSelectionInitialState()) {
    on<LoadDexSelectionContent>(_onLoadDexSelectionContent);
  }

  void _onLoadDexSelectionContent(
      LoadDexSelectionContent event, Emitter<DexSelectionState> emit) async {

    final getDexSelectionContent = serviceLocator<GetDexSelectionContent>();

    try {
      if (state is DexSelectionLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const DexSelectionLoading());
      Log.debug("fetching home content");


      final result = await getDexSelectionContent.execute();


      result.fold((error) {
        emit(DexSelectionError(message: error.message));
      }, (regions) => emit(DexSelectionSuccess(regions: regions)));

    } catch (e) {
      Log.debug(e.toString());
      emit(DexSelectionError(message: e.toString()));
    }
  }
}
