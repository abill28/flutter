// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

part of 'model.dart';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
    Surah({
        required this.code,
        required this.status,
        required this.data,
    });

    int code;
    String status;
    List<ListSurah> data;

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        code: json["code"],
        status: json["status"],
        data: List<ListSurah>.from(json["data"].map((x) => ListSurah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ListSurah {
    ListSurah({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.numberOfAyahs,
        required this.revelationType,
    });

    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    int numberOfAyahs;
    String revelationType;

    factory ListSurah.fromJson(Map<String, dynamic> json) => ListSurah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: json["revelationType"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationType,
    };
}
