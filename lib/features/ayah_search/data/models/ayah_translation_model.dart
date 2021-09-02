import 'dart:convert';

import 'package:search_in_quran/features/ayah_search/domain/entities/ayah_translation.dart';

class AyahTranslationModel extends AyahTranslation {
  final int surahNumber;
  final int numberInSurah;
  final String text;
  final String surahName;
  final String englishNameTranslation;
  final String revelationType;
  final bool sajda;
  final String type;
  final String translatorName;

  AyahTranslationModel({
    required this.surahNumber,
    required this.numberInSurah,
    required this.text,
    required this.surahName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.sajda,
    required this.type,
    required this.translatorName,
  }) : super(
          surahNumber: surahNumber,
          numberInSurah: numberInSurah,
          text: text,
          surahName: surahName,
          englishNameTranslation: englishNameTranslation,
          revelationType: revelationType,
          sajda: sajda,
          type: type,
          translatorName: translatorName,
        );

  factory AyahTranslationModel.fromJson(Map<String, dynamic> json) {
    json = json["data"];
    final surah = json['surah'];
    final edition = json['edition'];

    return AyahTranslationModel(
      surahNumber: json['number'],
      numberInSurah: json['numberInSurah'],
      text: json['text'],
      surahName: surah['englishName'],
      englishNameTranslation: surah['englishNameTranslation'],
      revelationType: surah['revelationType'],
      sajda: json['sajda'],
      type: edition['type'],
      translatorName: edition['englishName'],
    );
  }

  factory AyahTranslationModel.fromRawJson(String jsonString) {
    return AyahTranslationModel.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      "surahNumber": surahNumber,
      "numberInSurah": numberInSurah,
      "text": text,
      "surahName": surahName,
      "englishNameTranslation": englishNameTranslation,
      "revelationType": revelationType,
      "sajda": sajda,
      "type": type,
      "translatorName": translatorName,
    };
  }
}
