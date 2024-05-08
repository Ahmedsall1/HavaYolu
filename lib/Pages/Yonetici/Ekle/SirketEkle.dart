// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Sirketler.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class SirketEkle extends StatelessWidget {
  late String name;
  SirketEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sirket Ekle',
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
                  child: Column(
                    children: [
                      const Icon(
                        Icons.apartment,
                        size: 50,
                        color: Color.fromRGBO(253, 222, 85, 1),
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
                            labelText: 'Adı',
                            hintText: 'Şirket Adi Giriniz',
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
                            if (name != "") {
                              Sirket(name);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Sirketler()));
                            }
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
                )),
          ],
        ),
      ),
    );
  }
}
