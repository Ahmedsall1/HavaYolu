// ignore_for_file: depend_on_referenced_packages, file_names, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Personeller.dart';

class PersonelEkle extends StatefulWidget {
  const PersonelEkle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonelEkleState createState() => _PersonelEkleState();
}

class _PersonelEkleState extends State<PersonelEkle> {
  String name = "";
  String gorev="Pilot";
  List<String> tip = ["Pilot", "Hostese"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Personel Ekle'),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset('images/$gorev.png',width: 200,height: 200,),
          Card(
            color: const Color.fromARGB(255, 0, 80, 150),
            elevation: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 30),
                    child: DropdownSearch<String>(
                      selectedItem: "Pilot",
                      
                      onChanged: (value) {
                          setState(() {
                            gorev = value!;
                          });
                        },
                      dropdownBuilder: (context, sleectedItem) {
                        gorev = sleectedItem.toString();
                        
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
                      items: tip,
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
                        name = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Personel Adi Giriniz',
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
                        color: const Color(0xFFFDDE55),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        if (name != "") {
                          if (gorev == tip.first) {
                            Pilot(name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Personeller()));
                          } else if (gorev == tip[1]) {
                            Hostese(name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Personeller()));
                          }
                        } else {
                          _showDialog(context);
                        }
                      },
                      child: const Text(
                        'Ekle',
                        style: TextStyle(
                          color: Color(0xFF005096),
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: const Text('Lutfan Personel Adi Giriniz !'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
