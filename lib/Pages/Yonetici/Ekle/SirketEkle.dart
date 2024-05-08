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
        title: const Text('Sirket Ekle'),
      ),
      body: Center(
        child: Column(
          children: [
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
                    hintText: 'Personel Adi Giriniz'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 150, 122),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (name != "") {

                      Sirket(name);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Sirketler()));
                  } 
                },
                child: const Text(
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
