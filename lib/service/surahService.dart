// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

part of 'service.dart';

class SurahService {
  getAllSurah() async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      Surah data = surahFromJson(res.body.toString());
      return data.data;
    } else {
      print("gagal");
      return [];
    }
  }

  getDetailSurah(int idSurah) async {
     Uri url = Uri.parse("https://api.alquran.cloud/v1/surah/${idSurah}");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      DetailSurah data = detailSurahFromJson(res.body.toString());
      // print(data.data.ayahs);
      return data.data.ayahs;
    } else {
      print("gagal");
      return [];
    }
  }
}