import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Personel/Pindex.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';
import 'package:havayolu/Pages/Yonetici/Login.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Sefer.dart';

void main() {
  DateTime dt = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  Sirket("Anadolu Jet");
  Yolcu yol = Yolcu("Muhammed");
  yol.Ytip = Yolcu.tip[1];
  Sefer s =
      Sefer(130, HavaYolu.Airports[0], HavaYolu.Airports[1], "12:30", dt, true);
  Ucak uc = Ucak(HavaYolu.UcakTipi[2], "AnadoluJet", Pilot("Ahmed S"),
      Hostese("Fatma"), "Anadolu");
  Ucus("12:30", s, uc, 300);
  Ucus("22:40", s, uc, 300);
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('images/logo.png'),
            ElevatedButton(
              child: const Text('Yoluc'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SeferBul()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Personel'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pindex()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Yonetici'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
