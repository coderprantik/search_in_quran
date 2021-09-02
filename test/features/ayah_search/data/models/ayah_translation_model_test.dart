import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:search_in_quran/features/ayah_search/data/models/ayah_translation_model.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah_translation.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final AyahTranslationModel tAyahTranslationModel = AyahTranslationModel(
    surahNumber: 1,
    numberInSurah: 2,
    text: 'আয়াত',
    surahName: 'surahName',
    englishNameTranslation: 'englishNameTranslation',
    revelationType: 'revelationType',
    sajda: false,
    type: 'type',
    translatorName: 'translatorName',
  );

  test(
    'should be a subclass of AyahTranslation entity',
    () async {
      // assert
      expect(tAyahTranslationModel, isA<AyahTranslation>());
    },
  );

  group('fromJson', () {
    test(
      'should get a valid model from JSON Map',
      () async {
        // act
        final result = AyahTranslationModel.fromJson(
          jsonDecode(fixture('ayah_translation.json')),
        );
        // assert
        expect(result, tAyahTranslationModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should get a JSON Map with proper data',
      () async {
        // act
        final result = tAyahTranslationModel.toJson();
        // assert
        final expected = jsonDecode(fixture('ayah_translation_cached.json'));
        expect(result, expected);
      },
    );
  });
  test(
    'should get a valid model from raw JSON',
    () async {
      // act
      final result = AyahTranslationModel.fromRawJson(
        fixture('ayah_translation.json'),
      );
      // assert
      expect(result, tAyahTranslationModel);
    },
  );
}
