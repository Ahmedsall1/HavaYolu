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
        title: const Text('Yolcular'),
      ),
      body: Column(
        children: [
          for (Yolcu yo in HavaYolu.YolcuList)
            Card(
              child: ListTile(
                leading: Icon(Icons.person_3_outlined,color: Colors.green,),
                title: Text("ID: "+yo.id.toString()+" Adi : "+yo.name),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YolcuDuzelt()),
                    );
                  },
                  child: Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text(" P: "+yo.Ytip+" H: "+yo.email+" K: "+yo.koltuk),
              ),
            )
        ],
      ),
    );
  }
}