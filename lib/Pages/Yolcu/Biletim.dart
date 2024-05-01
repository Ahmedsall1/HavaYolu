import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class Biletim extends StatelessWidget {
  late Yolcu yolcu;
  late Ucus ucus;
  String no;
  Biletim({
    super.key,
    required this.yolcu,
    required this.no,
    required this.ucus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yolcu'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(yolcu.name),
            Text(ucus.nerden),
            Text(no),
            Image.asset('images/Qr.png'),
        ],
        )
      ),
    );
  }
}
