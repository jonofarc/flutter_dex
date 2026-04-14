part of 'dex_view_bloc.dart';

@immutable
abstract class DexViewEvent {}

class LoadDexViewContent extends DexViewEvent {
  LoadDexViewContent();
}

class DexTapPokemonEvent extends DexViewEvent {
  final String? url;
  DexTapPokemonEvent({required this.url});
}
