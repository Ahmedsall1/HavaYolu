// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:havayolu/Pages/Personel/Pindex.dart';

import 'package:havayolu/Pages/Yonetici/Ekle/PersonelEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SeferEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/SirketEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcakEkle.dart';
import 'package:havayolu/Pages/Yonetici/Ekle/UcusEkle.dart';

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
      backgroundColor: const Color(0xFF005096),
      appBar: AppBar(
        backgroundColor: const Color(0xFF005096),
        iconTheme: const IconThemeData(color: Color(0xFFFDDE55)),
        title: const Text(
          'Yönetici',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFFDDE55),
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset(
              'images/admin.png',
              height: 100,
              width: 100,
            ),

            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box_rounded,
                        color: Color.fromRGBO(253, 222, 85, 1), size: 50),
                    Text(
                      " Ekle",
                      style: TextStyle(
                        color: Color.fromRGBO(253, 222, 85, 1),
                        fontSize: 36,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(253, 222, 85, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Personel Ekle',
                      style: TextStyle(
                        color: Color(0xFF005096),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PersonelEkle()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(253, 222, 85, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Sefer Ekle',
                      style: TextStyle(
                        color: Color(0xFF005096),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SeferEkle()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(253, 222, 85, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Sirket Ekle',
                      style: TextStyle(
                        color: Color(0xFF005096),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SirketEkle()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(253, 222, 85, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Ucak Ekle',
                      style: TextStyle(
                        color: Color(0xFF005096),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UcakEkle()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(253, 222, 85, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Ucus Ekle',
                      style: TextStyle(
                        color: Color(0xFF005096),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UcusEkle()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ////////////////////////////////Personele Sorgula //////////////////////////////////
            Column(children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.screen_search_desktop_outlined,
                    color: Color.fromRGBO(253, 222, 85, 1),
                    size: 40,
                  ),
                  Text(
                    " Sorgula",
                    style: TextStyle(
                      color: Color.fromRGBO(253, 222, 85, 1),
                      fontSize: 30,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 222, 85, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: const Text(
                    'Personele Sorgula',
                    style: TextStyle(
                      color: Color(0xFF005096),
                      fontSize: 25,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pindex()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),

            //////////////////////////////// Duzelt&Sil //////////////////////////////////

            //////////////////////////////// Dashbord //////////////////////////////////
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF005096),
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                "Personeller",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Personeller())),
            ),
            ListTile(
              title: const Text(
                "Seferler",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Seferler())),
            ),
            ListTile(
              title: const Text(
                "Şirketler",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Sirketler())),
            ),
            ListTile(
              title: const Text(
                "Uçaklar",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Ucaklar())),
            ),
            ListTile(
              title: const Text(
                "Uçuşlar",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Ucuslar())),
            ),
            ListTile(
              title: const Text(
                "Yolcular",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Yolcular())),
            ),
          ],
        ),
      ),
    );
  }
}
