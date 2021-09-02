import 'package:dartz/dartz.dart';
import 'package:search_in_quran/core/error/failure.dart';
import 'package:search_in_quran/core/usecases/usecase.dart';
import 'package:search_in_quran/features/ayah_search/domain/entities/ayah.dart';
import 'package:search_in_quran/features/ayah_search/domain/repository/ayah_search_repository.dart';

class GetAyah implements Usecase<Ayah, String> {
  final AyahSearchRepository repository;

  GetAyah(this.repository);

  Future<Either<Failure, Ayah>> call(String query)  async {
    return await repository.getAyah(query);
  }
}
