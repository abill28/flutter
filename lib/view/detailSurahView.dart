import 'package:flutter/material.dart';
import 'package:quran_app/app/constanst/color.dart';
import 'package:quran_app/model/detailSurah.dart';

import '../service/service.dart';

class DetailSurahView extends StatefulWidget {
  final int idSurah;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;
  final String englishNameTranslation;
  DetailSurahView(
      {required this.idSurah,
      required this.englishName,
      required this.numberOfAyahs,
      required this.revelationType,
      required this.englishNameTranslation});

  @override
  State<DetailSurahView> createState() => _DetailSurahViewState();
}

class _DetailSurahViewState extends State<DetailSurahView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SURAH ${widget.englishName}'),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
            future: SurahService().getDetailSurah(widget.idSurah),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak Ada Data"),
                );
              }
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [appPurpleLight1, appPurpleDark])),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'SURAH ${widget.englishName.toUpperCase()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: appWhite),
                          ),
                          Text(
                            '( ${widget.englishNameTranslation})',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appWhite),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' ${widget.numberOfAyahs} Ayat | ${widget.revelationType} ',
                            style: TextStyle(fontSize: 16, color: appWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Ayah ayat = snapshot.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appPurpleLight2.withOpacity(0.3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "../assets/images/list.png"),
                                              fit: BoxFit.contain)),
                                      child: Center(
                                          child: Text(
                                              ayat.numberInSurah.toString())),
                                    ),
                                    // Text(ayat.numberInSurah.toString()),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              AlertDialog(
                                                title: Text("BookMark"),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text("Last Read")),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text("Bookmark"))
                                                ],
                                              );
                                            },
                                            icon: Icon(
                                                Icons.bookmark_add_outlined)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.play_arrow))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      ayat.text,
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              );
            }));
  }
}
