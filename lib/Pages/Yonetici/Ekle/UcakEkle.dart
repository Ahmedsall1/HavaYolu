import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Seferler.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Ucaklar.dart';

List<String> pilotlis = [];
List<String> hostlist = [];
List<String> sirketlist = [];

class UcakEkle extends StatefulWidget {
  UcakEkle({Key? key}) : super(key: key) {
    for (Personel per in HavaYolu.PersonelList) {
      if (per.gettip() == "Pilot") {
        pilotlis.add(per.name);
      } else if (per.gettip() == "Hostese") {
        hostlist.add(per.name);
      }
    }
    for (Sirket sir in HavaYolu.SirketiList) {
      sirketlist.add(sir.name);
    }
  }

  @override
  _UcakEkle createState() => _UcakEkle();
}

class _UcakEkle extends State<UcakEkle> {
  String name = "";
  String sirketadi = "";

  late Personel? pilot;
  late Personel? host;
  late String tip = HavaYolu.UcakTipi[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ucak Ekle'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: pilotlis.first,
                dropdownBuilder: (context, sleectedItem) {
                  pilot = HavaYolu.PersonelList.where(
                      (element) => element.name == sleectedItem).first;
                  return Text(sleectedItem.toString());
                },
                items: pilotlis,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: hostlist.first,
                dropdownBuilder: (context, sleectedItem) {
                  host = HavaYolu.PersonelList.where(
                      (element) => element.name == sleectedItem).first;
                  return Text(sleectedItem.toString());
                },
                items: hostlist,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: sirketlist.first,
                dropdownBuilder: (context, sleectedItem) {
                  sirketadi = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: sirketlist,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: HavaYolu.UcakTipi[0],
                dropdownBuilder: (context, sleectedItem) {
                  tip = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: HavaYolu.UcakTipi,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
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
                  Ucak(tip, name, pilot!, host!, sirketadi);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Ucaklar()));
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
