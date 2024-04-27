import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class SeferEkle extends StatelessWidget {
  const SeferEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sefer Ekle'),
      ),
      body: Center(
        // child: ElevatedButton(
        //   child: const Text('Yonetici'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const KoltukSec()),
        //     );
        //   },
        // ),
      ),
    );
  }
}