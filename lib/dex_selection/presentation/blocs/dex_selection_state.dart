part of 'dex_selection_bloc.dart';

@immutable
abstract class DexSelectionState extends Equatable {
  const DexSelectionState();
  @override
  List<Object> get props => [];
}

class DexSelectionInitialState extends DexSelectionState {
  const DexSelectionInitialState();
}

class DexSelectionLoading extends DexSelectionState {
  const DexSelectionLoading();
}

class DexSelectionSuccess extends DexSelectionState {
  final Regions regions;
  const DexSelectionSuccess({required this.regions});

}

class DexSelectionError extends DexSelectionState {
  final String message;
  const DexSelectionError({required this.message});
}
