import 'package:equatable/equatable.dart';

class AyahTranslation extends Equatable {
  final int surahNumber;
  final int numberInSurah;
  final String text;
  final String surahName;
  final String englishNameTranslation;
  final String revelationType;
  final bool sajda;
  final String type;
  final String translatorName;

  AyahTranslation({
    required this.surahNumber,
    required this.numberInSurah,
    required this.text,
    required this.surahName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.sajda,
    required this.type,
    required this.translatorName,
  });

  @override
  List<Object?> get props => [
        surahNumber,
        numberInSurah,
        text,
        surahName,
        englishNameTranslation,
        revelationType,
        sajda,
        type,
        translatorName,
      ];
}
