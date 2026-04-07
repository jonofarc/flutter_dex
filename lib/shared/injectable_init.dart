import 'package:flutter_dex/dex_selection/domain/usecases/get_home_content.dart';
import 'package:flutter_dex/dex_selection/presentation/blocs/dex_selection_bloc.dart';
import 'package:flutter_dex/generated/l10n.dart';
import 'package:get_it/get_it.dart';


final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerLazySingleton<S>(() => S());

  serviceLocator.registerFactory<DexSelectionBloc>(() => DexSelectionBloc());
  serviceLocator.registerFactory<GetDexSelectionContent>(() => GetDexSelectionContent());

}
