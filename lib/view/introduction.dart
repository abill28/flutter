// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/view/home.dart';

// ignore: use_key_in_widget_constructors
class Introduction extends StatefulWidget {
  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Al-Qur'an",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Apakah Anda Sudah Membaca Quran Hari Ini?",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            // ignore: sized_box_for_whitespace
            Container(
                width: 300,
                height: 300,
                child: Lottie.asset("assets/lotties/animasi-quran.json")),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeView())),
              child: Text(
                "Baca Quran",
              ),
            )
          ],
        ),
      ),
    );
  }
}
