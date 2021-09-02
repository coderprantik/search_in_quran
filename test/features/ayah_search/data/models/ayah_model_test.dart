import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_in_quran/features/ayah_search/data/models/ayah_model.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAyahModel = AyahModel(
    surahNumber: 1,
    numberInSurah: 2,
    text: "اية",
    surahName: "surahName",
    englishNameTranslation: "englishNameTranslation",
    revelationType: "revelationType",
    sajda: false,
    type: "type",
  );

  test(
    'should be a subclass of Ayah entity',
    () async {
      // assert
      expect(tAyahModel, isA<Ayah>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from JSON Map',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture("ayah.json"));
        // act
        final result = AyahModel.fromJson(jsonMap);
        // assert
        expect(result, tAyahModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tAyahModel.toJson();
        // assert
        final expected = jsonDecode(fixture('ayah_cached.json')); // toJson has to same the cache
        expect(result, expected);
      },
    );
  });

  test(
    'should return a valid model from Raw JSON',
    () async {
      // act
      final result = AyahModel.fromRawJson(fixture('ayah.json'));
      // assert
      expect(result, tAyahModel);
    },
  );
}
