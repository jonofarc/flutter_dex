part of 'dex_selection_bloc.dart';

@immutable
abstract class DexSelectionEvent {}

class LoadDexSelectionContent extends DexSelectionEvent {
  LoadDexSelectionContent();
}
