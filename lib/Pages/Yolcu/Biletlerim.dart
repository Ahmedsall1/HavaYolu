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
        body: Column(
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
// Card(
//               color: const Color.fromARGB(255, 0, 80, 150),
//               elevation: 20.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ListTile(
//                   title: Row(
//                     children: [
//                       ucuslar[index].ucak.sirket.logo,
//                       Text(
//                         '  ${ucuslar[index].ucak.sirket.name}',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           color: Color(0xFFFDDE55),
//                           fontFamily: "Times New Roman",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20.0,
//                       ),
//                       Text(
//                         "${ucuslar[index].saat} -> $result",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontFamily: "Times New Roman",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // leading: ucuslar[index].ucak.sirket.logo,
//                   subtitle: Row(
//                     children: [
//                       const SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         " ${ucuslar[index].sure} dk",
//                         style:
                        
//                             const TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Times New Roman",
//                                 fontWeight: FontWeight.w600,),
//                       ),
//                       const SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         " 1x15 kg",
//                         style:
//                             const TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Times New Roman",
//                                 fontWeight: FontWeight.w600,),
//                       ),
//                       const SizedBox(
//                         width: 30.0,
//                       ),
//                       Text(
//                         " ${ucuslar[index].ucret} TL",
//                         style:
//                             const TextStyle(fontSize: 20, color: Color(0xFFFDDE55),fontFamily: "Times New Roman",
//                                 fontWeight: FontWeight.w600,),
//                       ),
//                     ],
//                   ),
//                   trailing: IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 KoltukSec(id: ucuslar[index].i)),
//                       );
//                     },
//                     icon: Image.asset(
//                       'images/Ucus.png',
//                       width: 40,
//                       height: 40,
//                     ),
//                   ),
//                 ),
//               ),
//             );