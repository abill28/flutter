// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:html';
import 'dart:ui';

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
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bismillahirrahmanirrahiim",  
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight1, appPurpleDark])),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: -10,
                              right: 0,
                              child: Opacity(
                                opacity: 0.6,
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset(
                                      "./assets/images/alquran.png",
                                      fit: BoxFit.contain,
                                    )),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(color: appWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Al-fatihah",
                                  style:
                                      TextStyle(color: appWhite, fontSize: 20),
                                ),
                                Text(
                                  "Juz 1 | Ayat 5",
                                  style:
                                      TextStyle(color: appWhite, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                indicatorColor: appPurpleDark,
                labelColor: appPurpleDark,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "Bookmark",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  FutureBuilder<dynamic>(
                    future: SurahService().getAllSurah(),
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
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            ListSurah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailSurahView(
                                              idSurah: surah.number,
                                              englishName: surah.englishName,
                                              numberOfAyahs:
                                                  surah.numberOfAyahs,
                                              revelationType:
                                                  surah.revelationType,
                                              englishNameTranslation:
                                                  surah.englishNameTranslation,
                                            )));
                              },
                              leading: Container(
                                  height: 50,
                                  width: 50,
                                  // color: Colors.amber,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "../assets/images/list.png")),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "${surah.number}",
                                    style: TextStyle(color: appPurpleDark),
                                  ))),
                              // ignore: prefer_const_constructors, unnecessary_string_interpolations
                              title: Text(
                                "${surah.englishName}",
                                style: TextStyle(color: appPurpleDark),
                              ),
                              // // ignore: prefer_const_constructors
                              subtitle: Text(
                                "${surah.numberOfAyahs} Ayat",
                              ),
                              // // ignore: prefer_const_constructors, unnecessary_string_interpolations
                              trailing: Text(
                                "${surah.revelationType}",
                                style: TextStyle(color: appPurpleDark),
                              ),
                            );
                          });
                    },
                  ),
                  ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: Container(
                            height: 50,
                            width: 50,
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("../assets/images/list.png")),
                            ),
                            child: Center(
                                child: Text(
                              "${index + 1}",
                              style: TextStyle(color: appPurpleDark),
                            ))),
                        // ignore: prefer_const_constructors, unnecessary_string_interpolations
                        title: Text(
                          "Juz ${index + 1}",
                          style: TextStyle(color: appPurpleDark),
                        ),
                        // // ignore: prefer_const_constructors
                      );
                      ;
                    },
                  ),
                  Center(child: Text("page Bookmark"))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
