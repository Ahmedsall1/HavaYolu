import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class Bilet extends StatelessWidget {
  late Yolcu yolcu;
  late Ucus ucus;
  String No;
  Bilet({
    super.key,
    required this.yolcu,
    required this.No,
    required this.ucus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yolcu'),
      ),
      body: Center(
        // child: ElevatedButton(
        //   child: const Text('Bilet'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const SeferBul()),
        //     );
        //   },
        // ),
      ),
    );
  }
}
