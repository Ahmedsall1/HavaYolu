import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class PersonelSorgula extends StatelessWidget {
  const PersonelSorgula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Sorgula'),
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