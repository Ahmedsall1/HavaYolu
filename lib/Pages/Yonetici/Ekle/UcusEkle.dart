import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Seferler.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Ucuslar.dart';

List<String> seferlist = [];
List<String> ucaklist = [];

class UcusEkle extends StatefulWidget {
  UcusEkle({Key? key}) : super(key: key) {
    for (Sefer sefer in HavaYolu.SeferList) {
      seferlist.add(sefer.no.toString());
    }
    for (Ucak ucak in HavaYolu.UcakList) {
      ucaklist.add(ucak.id.toString());
    }
  }

  @override
  _UcusEkle createState() => _UcusEkle();
}

class _UcusEkle extends State<UcusEkle> {
  bool se = false;
  bool uc = false;
  late Ucak ucak;
  String ucakbilgi = "";
  String nerden = HavaYolu.Airports[0];
  String nereye = HavaYolu.Airports[2];
  String tarih = "";
  late Sefer sefer;
  late int seferno;
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String sure = HavaYolu.Saat[1];
  late double ucret;
  late DateTime selectedDate = DateTime.now();
  late DateTime nextYear = selectedDate.add(const Duration(days: 365));

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ucus Ekle'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: seferlist.first,
                onChanged: (selectedItem) {
                  for (Sefer sef in HavaYolu.SeferList) {
                    if (int.parse(selectedItem.toString()) == sef.no) {
                      sefer = sef;
                      setState(() {
                        se = true;
                      });
                    }
                  }
                },
                dropdownBuilder: (context, sleectedItem) {
                  return Text(sleectedItem.toString());
                },
                items: seferlist,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            if (se = true) Text(nerden + "->" + nereye + " T:" + tarih),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: ucaklist.first,
                onChanged: (selectedItem) {
                  for (Ucak sef in HavaYolu.UcakList) {
                    if (int.parse(selectedItem.toString()) == sef.id) {
                      ucak = sef;
                      ucakbilgi =
                          "A: ${sef.name} P:${sef.pilot.name} K:${sef.koltukSayisi} ${sef.hosteseList.first.name} T:${sef.tip}";
                      setState(() {
                        uc = true;
                      });
                    }
                  }
                },
                dropdownBuilder: (context, sleectedItem) {
                  return Text(sleectedItem.toString());
                },
                items: ucaklist,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            if (uc = true) Text(ucakbilgi),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: HavaYolu.Saat[1],
                dropdownBuilder: (context, sleectedItem) {
                  sure = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: HavaYolu.Saat,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: TextField(
                onChanged: (value) {
                  ucret = double.parse(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ucret',
                    hintText: 'Ucret'),
              ),
            ),
            
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 150, 122),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Ucus(sure, sefer, ucak, ucret);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Ucuslar()));
                },
                child: Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
        // child: ElevatedButton(
        //   child: const Text('Yonetici'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const KoltukSec()),
        //     );
        //   },
        // ),
      ),
    );
  }
}
