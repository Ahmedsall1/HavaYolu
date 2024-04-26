import 'package:flutter/material.dart';
// import 'package:havayolu/Classes/HavaYolu.dart';
// import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
// import 'package:havayolu/Classes/Ucus.dart';

class UcusSec extends StatelessWidget {
  final String nerden;
  final String nereye;
  final DateTime tarih;
  // Personel personel = Personel("Ahmed");
  UcusSec({
    Key? key,
    required this.nerden,
    required this.nereye,
    required this.tarih,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ucus Sec'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text('Koltuk Sec'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KoltukSec()),
              );
            },
          ),
          Column(
            children: [
              Center(
                child: Text(nerden + "======>"),
              ),
              Center(
                child: Text(nereye + "<======"),
              ),
              Center(
                child: Text("=========" + tarih.toString()),
              ),
              // Center(
              //   child: Text(personel.name),
              // ),
            ],
          ),
        ],
      )),
    );
  }
}
