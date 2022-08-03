// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

DetailSurah detailSurahFromJson(String str) => DetailSurah.fromJson(json.decode(str));

String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

class DetailSurah {
    DetailSurah({
        required this.code,
        required this.status,
        required this.data,
    });

    int code;
    String status;
    DataSurah data;

    factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        code: json["code"],
        status: json["status"],
        data: DataSurah.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}

class DataSurah {
    DataSurah({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.revelationType,
        required this.numberOfAyahs,
        required this.ayahs,
        required this.edition,
    });

    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    String revelationType;
    int numberOfAyahs;
    List<Ayah> ayahs;
    Edition edition;

    factory DataSurah.fromJson(Map<String, dynamic> json) => DataSurah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"],
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "numberOfAyahs": numberOfAyahs,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "edition": edition.toJson(),
    };
}

class Ayah {
    Ayah({
        required this.number,
        required this.text,
        required this.numberInSurah,
        required this.juz,
        required this.manzil,
        required this.page,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
    });

    int number;
    String text;
    int numberInSurah;
    int juz;
    int manzil;
    int page;
    int ruku;
    int hizbQuarter;
    bool sajda;

    factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
    };
}

class Edition {
    Edition({
        required this.identifier,
        required this.language,
        required this.name,
        required this.englishName,
        required this.format,
        required this.type,
        required this.direction,
    });

    String identifier;
    String language;
    String name;
    String englishName;
    String format;
    String type;
    String direction;

    factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
        direction: json["direction"],
    );

    Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
        "direction": direction,
    };
}
