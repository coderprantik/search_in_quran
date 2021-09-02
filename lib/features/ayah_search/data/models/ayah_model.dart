import 'dart:convert';

import 'package:search_in_quran/features/ayah_search/domain/entities/ayah.dart';

class AyahModel extends Ayah {
  final int surahNumber;
  final int numberInSurah;
  final String text;
  final String surahName;
  final String englishNameTranslation;
  final String revelationType;
  final bool sajda;
  final String type;

  AyahModel({
    required this.surahNumber,
    required this.numberInSurah,
    required this.text,
    required this.surahName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.sajda,
    required this.type,
  }) : super(
          surahNumber: surahNumber,
          numberInSurah: numberInSurah,
          text: text,
          surahName: surahName,
          englishNameTranslation: englishNameTranslation,
          revelationType: revelationType,
          sajda: sajda,
          type: type,
        );

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    json = json["data"];
    final surah = json['surah'];

    return AyahModel(
      surahNumber: json['number'],
      numberInSurah: json['numberInSurah'],
      text: json['text'],
      surahName: surah['englishName'],
      englishNameTranslation: surah['englishNameTranslation'],
      revelationType: surah['revelationType'],
      sajda: json['sajda'],
      type: json['edition']['type'],
    );
  }

  factory AyahModel.fromRawJson(String jsonString) {
    return AyahModel.fromJson(json.decode(jsonString));
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
    };
  }
}
