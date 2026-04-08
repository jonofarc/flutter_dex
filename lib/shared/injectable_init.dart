import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_selection/domain/usecases/get_dex_selection_content.dart';
import 'package:flutter_dex/dex_selection/presentation/blocs/dex_selection_bloc.dart';
import 'package:flutter_dex/dex_view/domain/usecases/get_dex_view_content.dart';
import 'package:flutter_dex/dex_view/presentation/blocs/dex_view_bloc.dart';
import 'package:flutter_dex/generated/l10n.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerLazySingleton<S>(() => S());

  serviceLocator.registerFactory<DexSelectionBloc>(() => DexSelectionBloc());
  serviceLocator.registerFactoryParam<DexViewBloc, Region, void>(
    (region, _) => DexViewBloc(region: region),
  );
  serviceLocator.registerFactory<GetDexSelectionContent>(() => GetDexSelectionContent());
  serviceLocator.registerFactory<GetDexViewContent>(() => GetDexViewContent());
}
