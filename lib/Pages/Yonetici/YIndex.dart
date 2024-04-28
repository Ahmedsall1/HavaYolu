import 'package:flutter/material.dart';

import 'package:havayolu/Pages/Yonetici/Ekle/PersonelEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SeferEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SirketEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcakEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcusEkle.dart';

import 'package:havayolu/Pages/Yonetici/Sorgula/PersonelSorgula.dart';

// import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/PersonelDuzelt.dart';
// import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SeferDuzelt.dart';
// import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SirketDuzelt.dart';
// import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcakDuzelt.dart';
// import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcusDuzelt.dart';

import 'package:havayolu/Pages/Yonetici/Dashboard/Personeller.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Seferler.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Sirketler.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Ucaklar.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Ucuslar.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Yolcular.dart';

class YIndex extends StatelessWidget {
  const YIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yonetici'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
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
                      MaterialPageRoute(
                          builder: (context) => const PersonelEkle()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Sefer Ekle'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeferEkle()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Sirket Ekle'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SirketEkle()),
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
                      MaterialPageRoute(
                          builder: (context) => const PersonelSorgula()),
                    );
                  },
                ),
              ],
            ),

            //////////////////////////////// Duzelt&Sil //////////////////////////////////

            
            //////////////////////////////// Dashbord //////////////////////////////////
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Personeller"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Personeller())),
            ),
            ListTile(
              title: const Text("Seferler"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Seferler())),
            ),
            ListTile(
              title: const Text("Sirketler"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sirketler())),
            ),
            ListTile(
              title: const Text("Ucaklar"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ucaklar())),
            ),
            ListTile(
              title: const Text("Ucuslar"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ucuslar())),
            ),
            ListTile(
              title: const Text("Ucaklar"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ucaklar())),
            ),
            ListTile(
              title: const Text("Yolcular"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Yolcular())),
            ),
          ],
        ),
      ),
    );
  }
}
