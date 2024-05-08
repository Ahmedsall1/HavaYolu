// ignore_for_file: file_names, depend_on_referenced_packages, use_super_parameters, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Seferler.dart';

class SeferEkle extends StatefulWidget {
  const SeferEkle({Key? key}) : super(key: key);

  @override
  _SeferEkle createState() => _SeferEkle();
}

class _SeferEkle extends State<SeferEkle> {
  String nerden = HavaYolu.Airports[0];
  String nereye = HavaYolu.Airports[2];
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String sure = HavaYolu.Saat[1];
  late int km;
  late DateTime selectedDate = DateTime.now();
  late DateTime nextYear = selectedDate.add(const Duration(days: 365));
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime.now(),
        lastDate: nextYear);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = selectedDate;
        print(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Sefer Ekle',
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/Ucus.png',
                          width: 40,
                          height: 40,
                          color: const Color(0xFFFDDE55),
                        ),
                        const Text(
                          " Nerden",
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
                        selectedItem: HavaYolu.Airports[0],
                        dropdownBuilder: (context, sleectedItem) {
                          nerden = sleectedItem.toString();
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
                        items: HavaYolu.Airports,
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
                          'images/Inis.png',
                          width: 40,
                          height: 40,
                          color: const Color(0xFFFDDE55),
                        ),
                        const Text(
                          " Nereye",
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
                        selectedItem: HavaYolu.Airports[1],
                        dropdownBuilder: (context, sleectedItem) {
                          nereye = sleectedItem.toString();
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
                        items: HavaYolu.Airports,
                        popupProps: const PopupProps.bottomSheet(
                          showSelectedItems: true,
                          isFilterOnline: true,
                          showSearchBox: true,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.hourglass_bottom_rounded,
                            color: Color.fromRGBO(253, 222, 85, 1)),
                        Text(
                          " Süre",
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
                        Icon(Icons.call_missed_outgoing_sharp,
                            color: Color.fromRGBO(253, 222, 85, 1)),
                        Text(
                          " KM",
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
                          km = int.parse(value);
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'KM',
                          hintText: 'KM',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.date_range_outlined,
                                  color: Color(0xFF005096),
                                ),
                                Text(
                                  ' ${selectedDate.toLocal().day}/${selectedDate.toLocal().month}/${selectedDate.toLocal().year}',
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 0, 80, 150)),
                                ),
                              ],
                            )),
                            const SizedBox(width: 20,),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(253, 222, 85, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              Sefer(km, nerden, nereye, sure, date, true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Seferler()));
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
