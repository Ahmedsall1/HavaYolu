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
        title:  Text("Ucus Bul"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ucuslar.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:
                  Text('${ucuslar[index].nerden.replaceAll("Airport","")}-->${ucuslar[index].nereye.replaceAll("Airport","")}'),
              leading: Text(ucuslar[index].ucret.toString()),
              subtitle: Text(ucuslar[index].saat),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KoltukSec(id: ucuslar[index].i)),
                  );
                },
                icon: Icon(Icons.send),
              ),
            );
          },
        ),
      ),
    );
  }
}
