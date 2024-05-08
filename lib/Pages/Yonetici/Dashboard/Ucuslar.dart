// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcusDuzelt.dart';

class Ucuslar extends StatelessWidget {
  const Ucuslar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ucuslar',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 80, 150),
            fontSize: 20,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (Ucus ucus in HavaYolu.UcusList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: const Icon(
                  Icons.airplane_ticket_outlined,
                  color: Color(0xFFFDDE55),
                ),
                title: Text(
                  "Tarih: ${ucus.formattedDate}   Saat : ${ucus.saat} KM",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFFDDE55),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UcusDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit, color: Color(0xFFFDDE55)),
                ),
                subtitle: Text(
                  "${ucus.nerden}->${ucus.nereye} ${ucus.KM} KM  P: ${ucus.ucak.pilot.name} Ş: ${ucus.ucak.name}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFFDDE55),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
