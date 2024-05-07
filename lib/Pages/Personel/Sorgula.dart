// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/Ucus.dart';

// ignore: must_be_immutable
class Sorgula extends StatelessWidget {
  late Personel person;
  late int id;
  late int listId;
  Sorgula({super.key, required this.id, required this.listId}) {
    person = HavaYolu.PersonelList[listId];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Uçuşlarım',
                  style:  TextStyle(
                    fontSize: 30,
                    color:  Color.fromARGB(255, 0, 80, 150),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),),
      ),
      body: ListView(
        children: [

            Image.asset('images/${person.gettip()}.png',width: 300,height: 300,),


          
          for (Ucus ucus in person.Ucuslar)
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: ListTile(
                leading: const Icon(
                  Icons.airplane_ticket_outlined,
                  color: Color(0xFFFDDE55),
                ),
                title: Text(
                  "Tarih: ${ucus.formattedDate}   Saat : ${ucus.saat}dk ${ucus.KM} KM",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFFDDE55),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "${ucus.nerden}->${ucus.nereye} \nP: ${ucus.ucak.pilot.name}  Şirket: ${ucus.ucak.name} ",
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

// Card(
//                 color: const Color.fromARGB(255, 0, 80, 150),
// //               elevation: 20.0,
//                 child: ListTile(
//                   leading: const Icon(
//                     Icons.airplane_ticket_outlined,
//                     color: Color(0xFFFDDE55),
//                   ),
//                   title: Text(
//                     "Bilet ID: ${bilet.id}\t  Koltuk:${bilet.koltuk.No}\t  ${bilet.ucus.formattedDate} ${bilet.ucus.saat} \n${bilet.ucus.nerden} >> ${bilet.ucus.nereye}    ",
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFFFDDE55),
//                       fontFamily: "Times New Roman",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   trailing: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 Biletim( bilet: bilet)),
//                       );
//                     },
//                     child: const Icon(Icons.open_in_browser_rounded,
//                         color: Color(0xFFFDDE55)),
//                   ),
//                   subtitle: Text(
//                     "Yolcu : ${bilet.yolcu.name} \tT: ${bilet.koltuk.koltuktipi} \t${bilet.koltuk.ucret}TL",
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFFFDDE55),
//                       fontFamily: "Times New Roman",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               )