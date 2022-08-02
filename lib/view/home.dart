// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:quran_app/model/model.dart';
import 'package:quran_app/service/service.dart';

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
          title: Text("Home View"),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
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
                  Surah surah = snapshot.data![index];
                  return ListTile(
                      leading: CircleAvatar(
                        child: Text("${surah.number}"),
                      ),
                      // ignore: prefer_const_constructors, unnecessary_string_interpolations
                      title: Text("${surah.name.transliteration.id}"),
                      // ignore: prefer_const_constructors
                      subtitle: Text("${surah.numberOfVerses} Ayat | ${surah.revelation.id}"),
                      // ignore: prefer_const_constructors, unnecessary_string_interpolations
                      trailing: Text("${surah.name.short}"),
                    );
                  }
                );
          },
        ));
  }
}
