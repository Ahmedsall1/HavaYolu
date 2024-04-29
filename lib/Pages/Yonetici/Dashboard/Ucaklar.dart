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
        title: const Text('Ucaklar'),
      ),
      body: Column(
        children: [
          for (Ucak uc in HavaYolu.UcakList)
            Card(
              child: ListTile(
                leading: Icon(Icons.airplane_ticket_sharp),
                title: Text("ID: "+uc.id.toString()+" Adi : "+uc.name+" K: "+uc.koltukSayisi.toString()),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UcakDuzelt()),
                    );
                  },
                  child: Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text(" P: "+uc.pilot.name+" H: "+uc.hosteseList.first.name+" Ş: "+uc.sirketadi),
              ),
            )
        ],
      ),
    );
  }
}