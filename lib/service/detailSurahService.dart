// // ignore: duplicate_ignore
// // ignore: file_names
// // ignore_for_file: file_names

// part of 'service.dart';

// class SurahService {
//   getAllSurah() async {
//     Uri url = Uri.parse("https://api.alquran.cloud/v1/surah");
//     var res = await http.get(url);

//     if (res.statusCode == 200) {
//       Surah data = surahFromJson(res.body.toString());
//       return data.data;
//     } else {
//       print("gagal");
//       return [];
//     }
//   }
// }