import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/dex_selection/domain/usecases/get_dex_selection_content.dart';
import 'package:flutter_dex/dex_selection/presentation/blocs/dex_selection_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dex_selection_bloc_test.mocks.dart';

@GenerateMocks([GetDexSelectionContent])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MockGetDexSelectionContent mockGetDexSelectionContent = MockGetDexSelectionContent();

  Regions regions = Regions(
    count: 2,
    results: [Region(name: 'kanto', url: ''), Region(name: 'johto', url: '')],
  );

  setUpAll(() async {
    final serviceLocator = GetIt.instance;
    serviceLocator.registerFactory<GetDexSelectionContent>(() => mockGetDexSelectionContent);
  });

  group('DexSelectionBloc', () {
    blocTest<DexSelectionBloc, DexSelectionState>(
      'emits [LoginLoading, LoginSuccess] when LoginSubmit is added successfully',
      build: () {
        DexSelectionBloc dexSelectionBloc = DexSelectionBloc();
        when(mockGetDexSelectionContent.execute()).thenAnswer((_) async => Future.value(Right(regions)));

        return dexSelectionBloc;
      },
      act: (bloc) {
        bloc.add(LoadDexSelectionContent());
      },
      expect: () => [const DexSelectionLoading(), DexSelectionSuccess(regions: regions)],
    );
  });
}
