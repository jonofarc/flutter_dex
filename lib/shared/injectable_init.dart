import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_selection/domain/usecases/get_dex_selection_content.dart';
import 'package:flutter_dex/dex_selection/presentation/blocs/dex_selection_bloc.dart';
import 'package:flutter_dex/dex_view/domain/usecases/get_dex_view_content.dart';
import 'package:flutter_dex/dex_view/presentation/blocs/dex_view_bloc.dart';
import 'package:flutter_dex/generated/l10n.dart';
import 'package:flutter_dex/poke_details/domain/usecases/poke_details_view_content.dart';
import 'package:flutter_dex/poke_details/presentation/blocs/poke_details_bloc.dart';
import 'package:flutter_dex/type/data/models/type_chart.dart';
import 'package:flutter_dex/type/domain/usecases/types_content.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerLazySingleton<S>(() => S());

  serviceLocator.registerFactory<DexSelectionBloc>(() => DexSelectionBloc());
  serviceLocator.registerFactoryParam<DexViewBloc, Region, void>(
    (region, _) => DexViewBloc(region: region),
  );
  serviceLocator.registerFactoryParam<PokeDetailsBloc, String, void>(
    (id, _) => PokeDetailsBloc(id: id),
  );
  serviceLocator.registerFactory<GetDexSelectionContent>(() => GetDexSelectionContent());
  serviceLocator.registerFactory<GetDexViewContent>(() => GetDexViewContent());
  serviceLocator.registerFactory<GetPokeDetailsContent>(() => GetPokeDetailsContent());
  serviceLocator.registerFactory<GetTypesContent>(() => GetTypesContent());

  serviceLocator.registerSingletonAsync<TypeChart>(() async {
    final typeChart = TypeChart();
    await typeChart.loadTypes();
    return typeChart;
  });

  // This is the "Glue": It ensures the app waits for TypeChart to finish
  // loading before the splash screen disappears.
  await serviceLocator.allReady();
}
