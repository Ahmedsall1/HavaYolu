import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class Bilet extends StatelessWidget {
  Ucus ucus;
  Koltuk koltuk;
  Bilet({super.key, required this.ucus,required this.koltuk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilet Olustur'),
      ),
      body: Column(
          children: [
            Text("Koltuk"+koltuk.No)
          ],
          ),
    );
  }
}
