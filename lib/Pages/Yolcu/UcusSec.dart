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
        title: Text("Ucus Bul"),
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
            int minute=minute1 + minute2;
            print(hour);
            if (minute >= 60) {
              hour += minute ~/ 60; // Add excess minutes to hours
              minute %= 60; // Set minutes to the remainder after dividing by 60
            }
            hour %= 24;
            String result = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
            return Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(
                    '${ucuslar[index].nerden.replaceAll("Airport", "")}--> ${ucuslar[index].nereye.replaceAll("Airport", "")}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  leading: Text(
                    ucuslar[index].i.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  subtitle: Text(
                    ucuslar[index].saat +
                        "->" +
                        result +"  "+
                        ucuslar[index].ucret.toString()+"TL",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                      width: 30,
                      height: 30,
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
