import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class Biletim extends StatelessWidget {
  late Yolcu yolcu;
  late Ucus ucus;
  late Koltuk koltuk;
  Biletim({
    super.key,
    required this.yolcu,
    required this.koltuk,
    required this.ucus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biletim'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
            children: [
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ucret : " + koltuk.ucret.toString() + " TL"),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Koltuk : " + koltuk.No),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sure : " + ucus.sure),
                ),
              ),
            ],
          ),
            Image.asset('images/Qr.png'),
        ],
        )
      ),
    );
  }
}
