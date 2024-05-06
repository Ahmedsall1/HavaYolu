// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Pages/Shared/Appbar.dart';

class Biletim extends StatelessWidget {
  late Bilet bilet;
  late String firstThreeCharacters;
  late String lastThreeCharacters;
  late String result;
  Biletim({super.key, required this.bilet}) {
    firstThreeCharacters = bilet.ucus.nerden.length >= 17
        ? bilet.ucus.nerden.substring(0, 15).toUpperCase()
        : bilet.ucus.nerden.toUpperCase();
    lastThreeCharacters = bilet.ucus.nereye.length >= 16
        ? bilet.ucus.nereye.substring(0, 15).toUpperCase()
        : bilet.ucus.nereye.toUpperCase();

    List<String> parts1 = bilet.ucus.saat.split(':');
    List<String> parts2 = bilet.ucus.sure.split(':');

    int hour1 = int.parse(parts1[0]);
    int minute1 = int.parse(parts1[1]);
    int hour2 = int.parse(parts2[0]);
    int minute2 = int.parse(parts2[1]);

    int totalMinutes = (hour1 * 60 + minute1) + (hour2 * 60 + minute2);

    int hour = totalMinutes ~/ 60;
    int minute = totalMinutes % 60;

    hour %= 24;
    result =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "Bilet", user: bilet.yolcu),
      body: Center(
          child: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            // elevation: 50.0,
            child: Padding(
                padding: const EdgeInsets.all(0.1),
                child: Column(
                  children: [
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromARGB(255, 0, 80, 150),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Image.asset(
                          'images/LeftLogo.png',
                          height: 50,
                          width: 150,
                        ),
                        const Text(
                          " BİNİŞ KARTI/BOARDING PASS",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 80, 150),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromARGB(255, 0, 80, 150),
                    ),
                  ],
                )),
          ),
          Card(
            color: const Color.fromARGB(255, 0, 80, 150),
            elevation: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "Yolcu",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        bilet.yolcu.name,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xFFFDDE55),
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        "uçuş",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 120.0,
                      ),
                      Text(
                        "Tarih",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        bilet.ucus.ucusNo,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 80.0,
                      ),
                      Text(
                        bilet.ucus.formattedDate,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xFFFDDE55),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        bilet.ucus.nerden.substring(0, 3).toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "  • ----- ",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(Icons.connecting_airports_rounded,
                          color: Color(0xFFFDDE55)),
                      const Text(
                        " ----- • ",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        bilet.ucus.nereye.substring(0, 3).toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        firstThreeCharacters,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        "${bilet.ucus.sure}dk",
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 60.0,
                      ),
                      Text(
                        lastThreeCharacters,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        bilet.ucus.saat,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 210.0,
                      ),
                      Text(
                        result,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFFDDE55),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(0.5),
                    ),
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "TERMİNAL",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      Text(
                        "KAPI",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      Text(
                        "KOLTUK",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50.0,
                      ),
                      const Text(
                        "1",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 100.0,
                      ),
                      const Text(
                        "7",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 80.0,
                      ),
                      Text(
                        bilet.koltuk.No,
                        style: const TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        color: const Color(0xFFFDDE55),
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            bilet.koltuk.koltuktipi,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 80, 150),
                              fontFamily: "Times New Roman",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                    ],
                  ),
                  Image.asset(
                    'images/Qr.png',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "HavaYolu",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 110.0,
                      ),
                      Text(
                        "API",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      Text(
                        "Güvenlik",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "235 2216 6747 63 / C1",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(
                        width: 85.0,
                      ),
                      Text(
                        "OK",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(
                        width: 90.0,
                      ),
                      Text(
                        "032",
                        style: TextStyle(
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
