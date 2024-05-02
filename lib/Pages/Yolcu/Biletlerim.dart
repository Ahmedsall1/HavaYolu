import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Shared/Appbar.dart';
import 'package:havayolu/Pages/Yolcu/Biletim.dart';

class Biletlerim extends StatelessWidget {
  late Yolcu yolcu;

  Biletlerim({
    super.key,
    required this.yolcu,
  });

  @override
  Widget build(BuildContext context) {
    if (yolcu.biletlerim.isEmpty) {
      return Scaffold(
        appBar: Appbar(title: "biletlerim",user: yolcu),
        body: const Center(child: Text("Biletiniz yok"),),
      );
    } else {
      return Scaffold(
        appBar: Appbar(title: "Biletlerim", user: yolcu),
        body: Column(
          children: [
            for (Bilet bilet in yolcu.biletlerim)
              Card(
                child: ListTile(
                  leading: Icon(Icons.airplane_ticket_outlined),
                  title: Text("Bilet ID: " +
                      bilet.id.toString() +
                      "  " +
                      bilet.ucus.nerden +
                      " -> " +
                      bilet.ucus.nereye),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Biletim(yolcu: yolcu, bilet: bilet)),
                      );
                    },
                    child: Icon(Icons.open_in_browser_rounded,
                        color: Colors.green),
                  ),
                  subtitle: Text("Adi : " + bilet.yolcu.name),
                ),
              )
          ],
        ),
      );
    }
  }
}
