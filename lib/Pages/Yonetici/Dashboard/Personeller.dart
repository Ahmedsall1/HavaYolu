// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/PersonelDuzelt.dart';

class Personeller extends StatelessWidget {
  const Personeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personeller',
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
          for (User per in HavaYolu.PersonelList)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: Image.asset(
                  'images/${per.gettip()}.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "ID :${per.id} ADI: ${per.name}",
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
                          builder: (context) => const PersonelDuzelt()),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Color.fromRGBO(253, 222, 85, 1),
                  ),
                ),
                subtitle: Text(
                  "Gorevi : ${per.gettip()}",
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
