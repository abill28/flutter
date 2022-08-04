// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/app/constanst/color.dart';
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
              "Al-Qur'an Apps",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Apakah Anda Sudah Membaca Quran Hari Ini?",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            // ignore: sized_box_for_whitespace
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: 300,
                  height: 300,
                  child: Lottie.asset("assets/lotties/animation-quran.json")),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeView())),
              child: Text(
                "Baca Quran", style: TextStyle(color: appWhite),
              ),
              style: ElevatedButton.styleFrom(primary: appPurpleDark,
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
            )
          ],
        ),
      ),
    );
  }
}
