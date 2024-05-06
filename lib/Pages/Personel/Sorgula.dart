
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/Ucus.dart';

// ignore: must_be_immutable
class Sorgula extends StatelessWidget {
  late Personel person;
  late int id;
  late int listId;
  Sorgula({super.key, required this.id, required this.listId}) {
    person = HavaYolu.PersonelList[listId];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorgula'),
      ),
      body: Column(
        children: [
          for (Ucus ucus in person.Ucuslar)
            Card(
              child: ListTile(
                leading: Text(ucus.i.toString()),
                title:  Text("Tarih: ${ucus.formattedDate}   Saat : ${ucus.saat} KM"),
                
                subtitle: Text("${ucus.nerden}->${ucus.nereye} ${ucus.KM} KM  P: ${ucus.ucak.pilot.name} Ş: ${ucus.ucak.name}"),
              ),
            )
        ],
      ),
    );
  }
}
