import 'package:flutter/material.dart';
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
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'SURAH ${widget.englishName.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '( ${widget.englishNameTranslation})',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' ${widget.numberOfAyahs} Ayat | ${widget.revelationType} ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
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
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child:
                                          Text(ayat.numberInSurah.toString()),
                                    ),
                                    // Text(ayat.numberInSurah.toString()),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
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
                            Text(ayat.text),
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
