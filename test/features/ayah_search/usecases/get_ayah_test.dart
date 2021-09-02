import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah.dart';
import 'package:search_in_quran/features/ayah_search/domain/usecases/get_ayah.dart';

import 'ayah_search_repository.mocks.dart';

// @GenerateMocks([AyahSearchRepository])
void main() {
  late GetAyah usecase;
  late MockAyahSearchRepository mockAyahSearchRepository;

  setUp(() {
    mockAyahSearchRepository = MockAyahSearchRepository();
    usecase = GetAyah(mockAyahSearchRepository);
  });

  final tQuery = "1:2";
  final tAyah = Ayah(
    surahNumber: 1,
    numberInSurah: 2,
    text: "text",
    surahName: "surahName",
    englishNameTranslation: "englishNameTranslation",
    revelationType: "revelationType",
    sajda: false,
    type: "type",
  );

  test(
    'should get Ayah for the query from the reposiotry',
    () async {
      // arrange
      when(mockAyahSearchRepository.getAyah(any))
          .thenAnswer((_) async => Right(tAyah));
      // act
      final result = await usecase(tQuery);
      // assert
      expect(result, Right(tAyah));
      verify(mockAyahSearchRepository.getAyah(tQuery));
      verifyNoMoreInteractions(mockAyahSearchRepository);
    },
  );
}
