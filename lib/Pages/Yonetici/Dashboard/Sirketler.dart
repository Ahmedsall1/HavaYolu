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
        title: const Text('Sirketler'),
      ),
      body: Column(
        children: [
          for (Sirket sir in HavaYolu.SirketiList)
            Card(
              child: ListTile(
                leading: Icon(Icons.apartment),
                title: Text("ID: "+sir.id.toString()+" Adi : "+sir.name),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SirketDuzelt()),
                    );
                  },
                  child: Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text("Ucaklari : "+sir.ucakList[0].name),
              ),
            )
        ],
      ),
    );
  }
}