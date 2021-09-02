import 'package:dartz/dartz.dart';
import 'package:search_in_quran/core/error/failure.dart';
import 'package:search_in_quran/core/usecases/usecase.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah_translation.dart';
import 'package:search_in_quran/features/ayah_search/domain/repository/ayah_search_repository.dart';

class GetAyahTranslation implements Usecase<AyahTranslation, String> {
  final AyahSearchRepository repository;

  GetAyahTranslation(this.repository);

  Future<Either<Failure, AyahTranslation>> call(String query) async {
    return await repository.getAyahTranslation(query);
  }
}
