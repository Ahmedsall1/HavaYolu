import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Shared/Appbar.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class Biletim extends StatelessWidget {
  late Yolcu yolcu;
  late Bilet bilet;
  Biletim({
    super.key,
    required this.yolcu,
    required this.bilet
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "biletim", user: yolcu),
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
                  child: Text("Ucret : " + bilet.koltuk.ucret.toString() + " TL"),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Koltuk : " + bilet.koltuk.No),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sure : " + bilet.ucus.sure),
                ),
              ),
            ],
          ),
          Image.asset('images/Qr.png'),
        ],
      )),
    );
  }
}
