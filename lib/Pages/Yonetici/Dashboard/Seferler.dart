// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SeferDuzelt.dart';

class Seferler extends StatelessWidget {
  const Seferler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seferler',
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
          for (Sefer sefer in HavaYolu.SeferList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: Image.asset(
                  'images/Ucus.png',
                  width: 30,
                  height: 30,
                  color:  const Color(0xFFFDDE55),
                ),
                title: Text(
                  "NO :${sefer.no} Nerden: ${sefer.nerden} Nereye: ${sefer.nereye}",
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
                          builder: (context) =>  SeferDuzelt(no: sefer.no,)),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Color.fromRGBO(253, 222, 85, 1),
                  ),
                ),
                subtitle: Text(
                  "Tarih : ${sefer.formattedDate} KM : ${sefer.KM} Tarih : ${sefer.sure}",
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
