// ignore_for_file: depend_on_referenced_packages, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Ucuslar.dart';

List<String> seferlist = [];
List<String> ucaklist = [];

class UcusEkle extends StatefulWidget {
  UcusEkle({super.key}) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Uçuş Ekle',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 80, 150),
            fontSize: 25,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/Ucus.png',
                        width: 50,
                        height: 30,
                        color: const Color.fromRGBO(253, 222, 85, 1),
                      ),
                      const Text(
                        "Sefer ID",
                        style: TextStyle(
                          color: Color.fromRGBO(253, 222, 85, 1),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        'images/Inis.png',
                        width: 50,
                        height: 30,
                        color: const Color.fromRGBO(253, 222, 85, 1),
                      ),
                    ],
                  ),
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
                        return Text(
                          sleectedItem.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                      items: seferlist,
                      popupProps: const PopupProps.bottomSheet(
                        showSelectedItems: true,
                        isFilterOnline: true,
                        showSearchBox: true,
                      ),
                    ),
                  ),
                  if (se = true)
                    Text(
                      "$nerden->$nereye T:$tarih",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Icon(
                        Icons.airplanemode_active_rounded,
                        color: Color.fromRGBO(253, 222, 85, 1),
                      ),
                      Text(
                        " Uçak ID",
                        style: TextStyle(
                          color: Color.fromRGBO(253, 222, 85, 1),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
                                "A: ${sef.name} P:${sef.pilot.name} K:${sef.koltukSayisi} ${sef.hosteseList.first.name} ";
                            setState(() {
                              uc = true;
                            });
                          }
                        }
                      },
                      dropdownBuilder: (context, sleectedItem) {
                        return Text(
                          sleectedItem.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                      items: ucaklist,
                      popupProps: const PopupProps.bottomSheet(
                        showSelectedItems: true,
                        isFilterOnline: true,
                        showSearchBox: true,
                      ),
                    ),
                  ),
                  if (uc = true)
                    Text(
                      ucakbilgi,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.av_timer_rounded,
                        color: Color.fromRGBO(253, 222, 85, 1),
                      ),
                      Text(
                        " Saat",
                        style: TextStyle(
                          color: Color.fromRGBO(253, 222, 85, 1),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 30),
                    child: DropdownSearch<String>(
                      selectedItem: HavaYolu.Saat[1],
                      dropdownBuilder: (context, sleectedItem) {
                        sure = sleectedItem.toString();
                        return Text(
                          sleectedItem.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                      items: HavaYolu.Saat,
                      popupProps: const PopupProps.bottomSheet(
                        showSelectedItems: true,
                        isFilterOnline: true,
                        showSearchBox: true,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Color.fromRGBO(253, 222, 85, 1),
                      ),
                      Text(
                        "Ucret",
                        style: TextStyle(
                          color: Color.fromRGBO(253, 222, 85, 1),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 30),
                    child: TextField(
                      onChanged: (value) {
                        ucret = double.parse(value);
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ucret',
                        hintText: 'Ucret',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(253, 222, 85, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        Ucus(sure, sefer, ucak, ucret);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Ucuslar()));
                      },
                      child: const Text(
                        'Ekle',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 80, 150),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ]),
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
