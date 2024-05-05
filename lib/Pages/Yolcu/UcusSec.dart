import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:intl/intl.dart';
// import 'package:havayolu/Classes/Sefer.dart';
// import 'package:havayolu/Classes/Personel.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class UcusSec extends StatelessWidget {
  String nerden;
  String nereye;
  DateTime tarih;
  DateFormat myFormat = DateFormat('yyyy-MM-dd');
  List<Ucus> ucuslar = [];

  // Personel personel = Personel("Ahmed");
  UcusSec({
    Key? key,
    required this.nerden,
    required this.nereye,
    required this.tarih,
  }) : super(key: key) {
    ucuslar = HavaYolu.ucuslar(
        nerden, nereye, DateTime.utc(tarih.year, tarih.month, tarih.day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${nerden.replaceAll("Airport", "")} >> ${nereye.replaceAll("Airport", "")}',
          style: TextStyle(color: Color.fromARGB(255, 0, 80, 150),fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ucuslar.length,
          itemBuilder: (BuildContext context, int index) {
            List<String> parts = ucuslar[index].saat.split(':');
            List<String> parts1 = ucuslar[index].sure.split(':');
            int hour1 = int.parse(parts1[0]);
            int hour2 = int.parse(parts[0] + parts1[0]);
            int minute1 = int.parse(parts[0]);
            int minute2 = int.parse(parts[1] + parts1[1]);
            int hour = hour1 + hour2;
            int minute = minute1 + minute2;
            if (minute >= 60) {
              hour += minute ~/ 60; // Add excess minutes to hours
              minute %= 60; // Set minutes to the remainder after dividing by 60
            }
            hour %= 24;
            String result =
                '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
            return Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Row(
                    children: [
                      ucuslar[index].ucak.sirket.logo,
                      Text(
                        '  ${ucuslar[index].ucak.sirket.name}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFDDE55),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "${ucuslar[index].saat} -> $result",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // leading: ucuslar[index].ucak.sirket.logo,
                  subtitle: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        " ${ucuslar[index].sure} dk",
                        style:
                        
                            const TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        " 1x15 kg",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        " ${ucuslar[index].ucret} TL",
                        style:
                            const TextStyle(fontSize: 20, color: Color(0xFFFDDE55),fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                KoltukSec(id: ucuslar[index].i)),
                      );
                    },
                    icon: Image.asset(
                      'images/Ucus.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
