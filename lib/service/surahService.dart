// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

part of 'service.dart';

class SurahService {
  getAllSurah() async {
    Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    // ignore: unnecessary_null_comparison
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}