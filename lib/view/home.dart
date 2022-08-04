// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quran_app/app/constanst/color.dart';
import 'package:quran_app/model/detailSurah.dart';
import 'package:quran_app/model/model.dart';
import 'package:quran_app/service/service.dart';
import 'package:quran_app/view/detailSurahView.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: duplicate_ignore, duplicate_ignore
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Al quran Apps"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamualaikum",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
                height: 200,
                child: Stack(
                  children: [
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJAb42qM3WNylSpskfSudSwfhR1Y0ntzx8Rw&usqp=CAU")
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                    gradient: LinearGradient(
                        colors: [appPurpleLight2, appPurpleDark])))
          ],
        ),
      ),
      // body: FutureBuilder<dynamic>(
      //   future: SurahService().getAllSurah(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: Text("Tidak Ada Data"),
      //       );
      //     }
      //     return ListView.builder(
      //         itemCount: snapshot.data!.length,
      //         itemBuilder: (context, index) {
      //           ListSurah surah = snapshot.data![index];
      //           return ListTile(
      //             onTap: (){
      //              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailSurahView(idSurah: surah.number,englishName: surah.englishName,numberOfAyahs: surah.numberOfAyahs,revelationType: surah.revelationType,englishNameTranslation: surah.englishNameTranslation,)));
      //             },
      //               leading: CircleAvatar(
      //                 child: Text("${surah.number}"),
      //               ),
      //               // ignore: prefer_const_constructors, unnecessary_string_interpolations
      //               title: Text("${surah.englishName}"),
      //               // // ignore: prefer_const_constructors
      //               subtitle: Text("${surah.numberOfAyahs} Ayat"),
      //               // // ignore: prefer_const_constructors, unnecessary_string_interpolations
      //               trailing: Text("${surah.revelationType}"),
      //             );
      //           }
      //         );
      //   },
      // )
    );
  }
}
