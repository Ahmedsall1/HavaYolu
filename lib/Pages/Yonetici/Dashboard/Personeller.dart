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
        title: const Text('Personeller'),
      ),
      body: ListView(
        children: [
          for (User per in HavaYolu.PersonelList)
            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text("ID: ${per.id} Adi : ${per.name}"),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonelDuzelt()),
                    );
                  },
                  child: const Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text("Gorevi : ${per.gettip()}"),
              ),
            )
        ],
      ),
    );
  }
}