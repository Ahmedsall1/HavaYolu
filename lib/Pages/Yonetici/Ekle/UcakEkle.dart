// ignore_for_file: use_super_parameters, depend_on_referenced_packages, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Classes/Ucak.dart';
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
        title: const Text(
          'Ucak Ekle',
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
                            'images/Pilot.png',
                            width: 50,
                            height: 30,
                          ),
                          const Text(
                            "Pilot",
                            style: TextStyle(
                              color: Color.fromRGBO(253, 222, 85, 1),
                              fontSize: 25,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 30),
                        child: DropdownSearch<String>(
                          selectedItem: pilotlis.first,
                          dropdownBuilder: (context, sleectedItem) {
                            pilot = HavaYolu.PersonelList.where(
                                    (element) => element.name == sleectedItem)
                                .first;
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
                          items: pilotlis,
                          popupProps: const PopupProps.bottomSheet(
                            showSelectedItems: true,
                            isFilterOnline: true,
                            showSearchBox: true,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/Hostese.png',
                            width: 50,
                            height: 30,
                          ),
                          const Text(
                            "Hostese",
                            style: TextStyle(
                              color: Color.fromRGBO(253, 222, 85, 1),
                              fontSize: 25,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 30),
                        child: DropdownSearch<String>(
                          selectedItem: hostlist.first,
                          dropdownBuilder: (context, sleectedItem) {
                            host = HavaYolu.PersonelList.where(
                                    (element) => element.name == sleectedItem)
                                .first;
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
                          items: hostlist,
                          popupProps: const PopupProps.bottomSheet(
                            showSelectedItems: true,
                            isFilterOnline: true,
                            showSearchBox: true,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.apartment,
                            color: Color.fromRGBO(253, 222, 85, 1),
                          ),
                          Text(
                            " Şirket",
                            style: TextStyle(
                              color: Color.fromRGBO(253, 222, 85, 1),
                              fontSize: 25,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 30),
                        child: DropdownSearch<String>(
                          selectedItem: sirketlist.first,
                          dropdownBuilder: (context, sleectedItem) {
                            sirketadi = sleectedItem.toString();
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
                          items: sirketlist,
                          popupProps: const PopupProps.bottomSheet(
                            showSelectedItems: true,
                            isFilterOnline: true,
                            showSearchBox: true,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.airplanemode_active,
                            color: Color.fromRGBO(253, 222, 85, 1),
                          ),
                          Text(
                            " Tipi",
                            style: TextStyle(
                              color: Color.fromRGBO(253, 222, 85, 1),
                              fontSize: 25,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 30),
                        child: DropdownSearch<String>(
                          selectedItem: HavaYolu.UcakTipi[0],
                          dropdownBuilder: (context, sleectedItem) {
                            tip = sleectedItem.toString();
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
                            color: const Color.fromRGBO(253, 222, 85, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            Ucak(tip, name, pilot!, host!, Sirket(sirketadi));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Ucaklar()));
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
                    ]))),
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
