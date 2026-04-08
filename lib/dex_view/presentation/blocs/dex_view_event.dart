part of 'dex_view_bloc.dart';

@immutable
abstract class DexViewEvent {}

class LoadDexViewContent extends DexViewEvent {
  LoadDexViewContent();
}
