import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah_translation.dart';
import 'package:search_in_quran/features/ayah_search/domain/usecases/get_ayah_translation.dart';

import 'ayah_search_repository.mocks.dart';

void main() {
  late GetAyahTranslation usecase;
  late MockAyahSearchRepository mockAyahSearchRepository;

  setUp(() {
    mockAyahSearchRepository = MockAyahSearchRepository();
    usecase = GetAyahTranslation(mockAyahSearchRepository);
  });

  final tQuery = "1:2";
  final tAyahTranslation = AyahTranslation(
    surahNumber: 1,
    numberInSurah: 2,
    text: "text",
    surahName: "surahName",
    englishNameTranslation: "englishNameTranslation",
    revelationType: "revelationType",
    sajda: false,
    type: "type",
    translatorName: 'translatorName',
  );

  test(
    'should get data for the query from the repository',
    () async {
      // arrange
      when(mockAyahSearchRepository.getAyahTranslation(any))
          .thenAnswer((_) async => Right(tAyahTranslation));
      // act
      final result = await usecase(tQuery);
      // assert
      expect(result, Right(tAyahTranslation));

      verify(mockAyahSearchRepository.getAyahTranslation(tQuery));
      verifyNoMoreInteractions(mockAyahSearchRepository);
    },
  );
}
