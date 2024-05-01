import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/Biletim.dart';

class Biletlerim extends StatelessWidget {
    late Yolcu yolcu;
  late Ucus ucus;
  late Koltuk koltuk;
  Biletlerim({
    super.key,
    required this.yolcu,
    required this.koltuk,
    required this.ucus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biletlerim'),
      ),
      body: Column(
        children: [
          for (Bilet bilet in yolcu.biletlerim)
            Card(
              child: ListTile(
                leading: Icon(Icons.airplane_ticket_outlined),
                title: Text("Bilet ID: "+bilet.id.toString()+"  "+bilet.ucus.nerden+" -> "+bilet.ucus.nereye),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Biletim(yolcu: yolcu,koltuk: koltuk,ucus: ucus,)),
                    );
                  },
                  child: Icon(Icons.open_in_browser_rounded,color:Colors.green),
                  
                ),
                subtitle: Text("Adi : "+bilet.yolcu.name),
              ),
            )
        ],
      ),
    );
  }
}