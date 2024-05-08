// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/YolcuDuzelt.dart';

class Yolcular extends StatelessWidget {
  const Yolcular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yolcular',
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
          for (Yolcu yo in HavaYolu.YolcuList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: Image.asset(
                  'images/Yolcu.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "ID: ${yo.id} ADI : ${yo.name}",
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
                          builder: (context) => const YolcuDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit, color: Color(0xFFFDDE55)),
                ),
                subtitle: Text(
                  " T: ${yo.Ytip} E: ${yo.email} K: ${yo.koltuk}",
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
