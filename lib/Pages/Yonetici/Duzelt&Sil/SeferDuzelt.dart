import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class SeferDuzelt extends StatelessWidget {
  late int no;
  SeferDuzelt({super.key,required this.no});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sefere Duzelt'),
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
