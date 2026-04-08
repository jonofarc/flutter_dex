part of 'dex_view_bloc.dart';

@immutable
abstract class DexViewState extends Equatable {
  const DexViewState();
  @override
  List<Object> get props => [];
}

class DexViewInitialState extends DexViewState {
  final Region region;
  const DexViewInitialState({required this.region});
}

class DexViewLoading extends DexViewState {
  const DexViewLoading();
}

class DexViewSuccess extends DexViewState {
  final List<PokemonEntry>? pokemonEntries;
  const DexViewSuccess({required this.pokemonEntries});
}

class DexViewError extends DexViewState {
  final String message;
  const DexViewError({required this.message});
}
