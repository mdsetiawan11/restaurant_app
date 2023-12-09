import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Lottie.asset(
                  'assets/developer.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Aplikasi dibuat oleh Muhammad Dadang Setiawan untuk memenuhi tugas proyek 1 pada kelas Belajar Fundamental Aplikasi Flutter - Dicoding.com',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}
