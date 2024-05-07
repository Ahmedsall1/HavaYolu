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
      appBar: AppBar(
        title: const Text(
          'Yönetici',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF005096),
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
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
        child: Card(
          color: const Color.fromARGB(255, 0, 80, 150),
          elevation: 20.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 100.0,
                    ),
                    Image.asset(
                      'images/LeftLogo.png',
                      height: 50,
                      width: 150,
                    ),
                  ],
                ),
                Card(
                    color: const Color.fromRGBO(253, 222, 85, 1),
                    elevation: 10.0,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ekle",
                                  style: TextStyle(
                                    color: Color(0xFF005096),
                                    fontSize: 40,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 210,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF005096),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: const Text(
                                  'Personel Ekle',
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 222, 85, 1),
                                    fontSize: 25,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PersonelEkle()),
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
                                  color: const Color(0xFF005096),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: const Text(
                                  'Sefer Ekle',
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 222, 85, 1),
                                    fontSize: 25,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeferEkle()),
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
                                  color: const Color(0xFF005096),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: const Text(
                                  'Sirket Ekle',
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 222, 85, 1),
                                    fontSize: 25,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SirketEkle()),
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
                                  color: const Color(0xFF005096),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: const Text(
                                  'Ucak Ekle',
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 222, 85, 1),
                                    fontSize: 25,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UcakEkle()),
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
                                  color: const Color(0xFF005096),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: const Text(
                                  'Ucus Ekle',
                                  style: TextStyle(
                                    color: Color.fromRGBO(253, 222, 85, 1),
                                    fontSize: 25,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UcusEkle()),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ))),

                ////////////////////////////////Personele Sorgula //////////////////////////////////
                Card(
                  color: const Color.fromRGBO(253, 222, 85, 1),
                  elevation: 10.0,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sorgula",
                              style: TextStyle(
                                color: Color(0xFF005096),
                                fontSize: 30,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              color: const Color(0xFF005096),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            child: const Text(
                              'Personele Sorgula',
                              style: TextStyle(
                                color: Color.fromRGBO(253, 222, 85, 1),
                                fontSize: 25,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pindex()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                              height: 20.0,
                            ),
                      ])),
                ),

                //////////////////////////////// Duzelt&Sil //////////////////////////////////

                //////////////////////////////// Dashbord //////////////////////////////////
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF005096),
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
                  MaterialPageRoute(builder: (context) => Personeller())),
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
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Seferler())),
            ),
            ListTile(
              title: const Text(
                "Sirketler",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sirketler())),
            ),
            ListTile(
              title: const Text(
                "Ucaklar",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ucaklar())),
            ),
            ListTile(
              title: const Text(
                "Ucuslar",
                style: TextStyle(
                  color: Color.fromRGBO(253, 222, 85, 1),
                  fontSize: 25,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ucuslar())),
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
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Yolcular())),
            ),
          ],
        ),
      ),
    );
  }
}
