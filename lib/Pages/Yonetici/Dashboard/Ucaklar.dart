// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/UcakDuzelt.dart';

class Ucaklar extends StatelessWidget {
  const Ucaklar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ucaklar',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 80, 150),
            fontSize: 25,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (Ucak uc in HavaYolu.UcakList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: const Icon(
                  Icons.airplanemode_active,
                  color: Color(0xFFFDDE55),
                ),
                title: Text(
                  "ID: ${uc.id} Adi : ${uc.name} K: ${uc.koltukSayisi}",
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
                          builder: (context) => const UcakDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit, color: Color(0xFFFDDE55)),
                ),
                subtitle: Text(
                  " P: ${uc.pilot.name} H: ${uc.hosteseList.first.name} Ş: ${uc.sirket.name}",
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
