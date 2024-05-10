// ignore_for_file: must_be_immutable, use_super_parameters, file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:intl/intl.dart';

import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class UcusSec extends StatelessWidget {
  String nerden;
  String nereye;
  DateTime tarih;
  DateFormat myFormat = DateFormat('yyyy-MM-dd');
  List<Ucus> ucuslar = [];

  UcusSec({
    Key? key,
    required this.nerden,
    required this.nereye,
    required this.tarih,
  }) : super(key: key) {
    ucuslar = HavaYolu.ucuslar(
        nerden, nereye, DateTime.utc(tarih.year, tarih.month, tarih.day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text(
            nerden.replaceAll("Airport", " "),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 80, 150),
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
          const RotationTransition(
            turns: AlwaysStoppedAnimation(90 /
                360), // Rotate the icon 90 degrees clockwise (to the right)
            child: Icon(
              Icons.airplanemode_active_outlined,
              color: Color.fromARGB(255, 0, 80, 150),
              size: 32,
            ),
          ),
          Expanded(
            child: Text(
              " ${nereye.replaceAll("Airport", " ")}",
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 80, 150),
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      )),
      body: Center(
        child: ListView.builder(
          itemCount: ucuslar.length,
          itemBuilder: (BuildContext context, int index) {
            List<String> parts1 = ucuslar[index].saat.split(':');
            List<String> parts2 = ucuslar[index].sure.split(':');

            int hour1 = int.parse(parts1[0]);
            int minute1 = int.parse(parts1[1]);
            int hour2 = int.parse(parts2[0]);
            int minute2 = int.parse(parts2[1]);

            int totalMinutes = (hour1 * 60 + minute1) + (hour2 * 60 + minute2);

            int hour = totalMinutes ~/ 60;
            int minute = totalMinutes % 60;

            hour %= 24;

            String result =
                '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
            return Card(
              color: const Color(0xFF005096),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Row(
                    children: [
                      ucuslar[index].ucak.sirket.logo,
                      Text(
                        '  ${ucuslar[index].ucak.sirket.name}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "${ucuslar[index].saat} -> $result",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // leading: ucuslar[index].ucak.sirket.logo,
                  subtitle: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        " ${ucuslar[index].sure} dk",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        " 1x15 kg",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        " ${ucuslar[index].ucret}TL",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                KoltukSec(id: ucuslar[index].i)),
                      );
                    },
                    icon: Image.asset(
                      'images/Ucus.png',
                      width: 40,
                      height: 40,
                      color: const Color(0xFFFDDE55),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
