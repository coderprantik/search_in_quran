import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/ayah.dart';
import '../entities/ayah_translation.dart';

abstract class AyahSearchRepository {
  Future<Either<Failure, Ayah>> getAyah(String query);
  Future<Either<Failure, AyahTranslation>> getAyahTranslation(String query);
}
