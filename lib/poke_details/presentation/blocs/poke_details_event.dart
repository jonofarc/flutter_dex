part of 'poke_details_bloc.dart';

@immutable
abstract class PokeDetailsEvent {}

class LoadPokeDetailsContent extends PokeDetailsEvent {
  LoadPokeDetailsContent();
}
