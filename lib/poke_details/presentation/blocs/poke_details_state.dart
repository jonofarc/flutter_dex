part of 'poke_details_bloc.dart';

@immutable
abstract class PokeDetailsState extends Equatable {
  const PokeDetailsState();
  @override
  List<Object> get props => [];
}

class PokeDetailsInitialState extends PokeDetailsState {
  final String id;
  const PokeDetailsInitialState({required this.id});
}

class PokeDetailsLoading extends PokeDetailsState {
  const PokeDetailsLoading();
}

class PokeDetailsSuccess extends PokeDetailsState {
  final PokemonForm pokemonForm;
  final PokemonDetailsSpecies pokemonDetailsSpecies;
  const PokeDetailsSuccess({
    required this.pokemonForm,
    required this.pokemonDetailsSpecies,
  });
}

class PokeDetailsError extends PokeDetailsState {
  final String message;
  const PokeDetailsError({required this.message});
}
