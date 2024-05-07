////////
import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';

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
        appBar: Appbar(title: "biletlerim", user: yolcu),
        body: const Center(
          child: Text(
            "Biletiniz yok",
            style:  TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 0, 80, 150),
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: Appbar(title: "Biletlerim", user: yolcu),
        body: ListView(
          children: [
            for (Bilet bilet in yolcu.biletlerim)
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
//               elevation: 20.0,
                child: ListTile(
                  leading: const Icon(
                    Icons.airplane_ticket_outlined,
                    color: Color(0xFFFDDE55),
                  ),
                  title: Text(
                    "Bilet ID: ${bilet.id}\t  Koltuk:${bilet.koltuk.No}\t  ${bilet.ucus.formattedDate} ${bilet.ucus.saat} \n${bilet.ucus.nerden} >> ${bilet.ucus.nereye}    ",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFFDDE55),
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Biletim( bilet: bilet)),
                      );
                    },
                    child: const Icon(Icons.open_in_browser_rounded,
                        color: Color(0xFFFDDE55)),
                  ),
                  subtitle: Text(
                    "Yolcu : ${bilet.yolcu.name} \tT: ${bilet.koltuk.koltuktipi} \t${bilet.koltuk.ucret}TL",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFFDDE55),
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    }
  }
}