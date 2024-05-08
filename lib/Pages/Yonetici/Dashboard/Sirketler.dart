// ignore_for_file: file_names, prefer_is_not_empty

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SirketDuzelt.dart';

class Sirketler extends StatelessWidget {
  const Sirketler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sirketler',
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
          for (Sirket sir in HavaYolu.SirketiList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: sir.logo,
                title: Text(
                  "ID: ${sir.id} Adi : ${sir.name}",
                  style: const TextStyle(
                    color: Color(0xFFFDDE55),
                    fontSize: 16,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SirketDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit, color: Color(0xFFFDDE55)),
                ),
                subtitle: Text(
                  "Uçakları : ${!sir.ucakList.isEmpty ? sir.ucakList[0].name : "Ucak yok"}",
                  style: const TextStyle(
                    color: Color(0xFFFDDE55),
                    fontSize: 16,
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
