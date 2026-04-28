import 'package:flutter/material.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/utils.dart';
import 'package:flutter_dex/type/data/models/type_chart.dart';
import 'package:flutter_dex/type/data/models/types.dart';
import 'package:flutter_dex/type/data/models/types_data_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks for the dependencies
@GenerateMocks([AudioPlayer, TypeChart])
import 'utils_test.mocks.dart';

void main() {
  late MockAudioPlayer mockPlayer;
  late MockTypeChart mockTypeChart;

  final mockRelation = DamageRelations(
    doubleDamageFrom: [
      TypeRef(name: 'ground', url: ''),
      TypeRef(name: 'rock', url: ''),
      TypeRef(name: 'electric', url: '')
    ],
    halfDamageFrom: [TypeRef(name: 'electric', url: '')],
    doubleDamageTo: [],
    halfDamageTo: [],
    noDamageFrom: [],
    noDamageTo: [],
  );

  final mockType = TypeResult(
    name: 'electric',
    typesDataDetails: TypesDataDetails(damageRelations: mockRelation),
    url: '',
  );

  setUp(() {
    mockPlayer = MockAudioPlayer();
    mockTypeChart = MockTypeChart();

    serviceLocator.allowReassignment = true;
    serviceLocator.registerSingleton<TypeChart>(mockTypeChart);
  });

  group('getTypeColor', () {
    test('should return correct color for fire type', () {
      expect(Utils.getTypeColor('fire'), Colors.deepOrange);
    });

    test('should return grey for unknown or default types', () {
      expect(Utils.getTypeColor('unknown'), Colors.grey);
      expect(Utils.getTypeColor('non-existent'), Colors.grey);
    });

    test('should be case-insensitive', () {
      expect(Utils.getTypeColor('WATER'), Colors.blue);
    });
  });

  group('getWeaknessesByName', () {
    test('should return empty list if types count is 0', () {
      when(mockTypeChart.types).thenReturn(Types(count: 0, results: []));

      final result = Utils.getWeaknessesByName('pikachu');
      expect(result, isEmpty);
    });

    test('should return correct weaknesses when type is found', () {
      // Mocking a successful find

      when(mockTypeChart.types).thenReturn(Types(count: 1, results: [mockType]));

      final result = Utils.getWeaknessesByName('electric');
      expect(result, contains('ground'));
      expect(result, contains('rock'));
      expect(result, contains('electric'));
    });
  });

  group('getResistanceByName', () {
    test('should return empty list if types count is 0', () {
      when(mockTypeChart.types).thenReturn(Types(count: 0, results: []));

      final result = Utils.getResistanceByName('pikachu');
      expect(result, isEmpty);
    });

    test('should return correct weaknesses when type is found', () {
      // Mocking a successful find

      when(mockTypeChart.types).thenReturn(Types(count: 1, results: [mockType]));

      final result = Utils.getResistanceByName('electric');
      expect(result, contains('electric'));
      expect(result, isNot(contains('ground')));
      expect(result, isNot(contains('rock')));
    });
  });
}
