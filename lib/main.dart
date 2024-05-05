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
  Sirket sirket=Sirket("Pegasus");
  // sirket.logo=Image.asset('images/Sirket/Pegasus_Airlines.jpg',width: 30,height: 30,);
  Yolcu yol = Yolcu("Muhammed");
  yol.Ytip = Yolcu.tip[1];
  Sefer s =
      Sefer(130, HavaYolu.Airports[0], HavaYolu.Airports[1], "12:30", dt, true);
  Ucak uc = Ucak(HavaYolu.UcakTipi[2], "AnadoluJet", Pilot("Ahmed S"),
      Hostese("Sıla S"), sirket);

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
      
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/logo.png',
              width: 250,
              height: 250,
            ),
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFFFDDE55), // Set background color to RGB(253, 222, 85)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Image.asset(
                            'images/Yolcu.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Yolcu',
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 0, 80, 150)),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SeferBul()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFFFDDE55), // Set background color to RGB(253, 222, 85)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Image.asset(
                            'images/Pilot.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Personel',
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 0, 80, 150)),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pindex()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFFFDDE55), // Set background color to RGB(253, 222, 85)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Image.asset(
                            'images/admin.png',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Yönetici',
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 0, 80, 150)),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
