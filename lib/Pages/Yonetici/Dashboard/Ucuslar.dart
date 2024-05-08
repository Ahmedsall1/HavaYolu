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
        title: const Text('Ucuslar'),
      ),
      body: Column(
        children: [
          for (Ucus ucus in HavaYolu.UcusList)
            Card(
              child: ListTile(
                leading: Text(ucus.i.toString()),
                title: Text("Tarih: ${ucus.formattedDate}   Saat : ${ucus.saat} KM"),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UcusDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit,color:Colors.green),
                ),
                subtitle: Text("${ucus.nerden}->${ucus.nereye} ${ucus.KM} KM  P: ${ucus.ucak.pilot.name} Ş: ${ucus.ucak.name}"),
              ),
            )
        ],
      ),
    );
  }
}
