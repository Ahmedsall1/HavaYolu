import 'package:flutter/material.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/PersonelEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SeferEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SirketEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcakEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcusEkle.dart';
import 'package:havayolu/Pages/Yonetici/Sorgula/PersonelSorgula.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/PersonelDuzelt.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SeferDuzelt.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SirketDuzelt.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcakDuzelt.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcusDuzelt.dart';

class YIndex extends StatelessWidget {
  const YIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yonetici'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
              child: const Text('Personel Ekle'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonelEkle()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Sefer Ekle'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeferEkle()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Sirket Ekle'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SirketEkle()),
                );
              },
            ),
            
              ],
            ),
            Row(
              children: [
                ElevatedButton(
              child: const Text('Ucak Ekle'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UcakEkle()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Ucus Ekle'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UcusEkle()),
                );
              },
            ),
              ],
            ),

            ////////////////////////////////Personele Sorgula //////////////////////////////////
            Row(
              children: [
                ElevatedButton(
              child: const Text('Personele Sorgula'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonelSorgula()),
                );
              },
            ),
              ],
            ),
            
            //////////////////////////////// Duzelt&Sil //////////////////////////////////
            
            Row(
              children: [
                ElevatedButton(
              child: const Text('Personel Duzelt&Sil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonelDuzelt()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Sefer Duzelt&Sil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeferDuzelt()),
                );
              },
            ),
            
            
              ],
            ),
            Row(
              children: [
                ElevatedButton(
              child: const Text('Sirket Duzelt&Sil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SirketDuzelt()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Ucak Duzelt&Sil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UcakDuzelt()),
                );
              },
            ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
              child: const Text('Ucsu Duzelt&Sil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UcusDuzelt()),
                );
              },
            ),
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}
