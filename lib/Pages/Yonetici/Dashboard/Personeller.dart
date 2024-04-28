import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/PersonelDuzelt.dart';

class Personeller extends StatelessWidget {
  Personeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personeller'),
      ),
      body: Column(
        children: [
          for (User per in HavaYolu.PersonelList)
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("ID: "+per.id.toString()+" Adi : "+per.name),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonelDuzelt()),
                    );
                  },
                  child: Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text("Gorevi : "+per.gettip()),
              ),
            )
        ],
      ),
    );
  }
}