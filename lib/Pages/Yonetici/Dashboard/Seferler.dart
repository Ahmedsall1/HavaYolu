import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Pages/Yonetici/Duzelt&Sil/SeferDuzelt.dart';

class Seferler extends StatelessWidget {
  const Seferler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seferler'),
      ),
      body: Column(
        children: [
          for (Sefer sefer in HavaYolu.SeferList)
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Sure: "+sefer.sure+" Saat  Mesafe : "+sefer.KM.toString()+" KM"),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeferDuzelt(no:sefer.no)),
                    );
                  },
                  child: Icon(Icons.edit,color:Colors.green),
                  
                ),
                subtitle: Text(sefer.nerden + "->" + sefer.nereye),
              ),
            )
        ],
      ),
    );
  }
}
