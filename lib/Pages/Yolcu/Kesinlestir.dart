import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Shared/MyCard.dart';
import 'package:havayolu/Pages/Yolcu/Biletlerim.dart';

// ignore: must_be_immutable
class Kesinlestir extends StatelessWidget {
  Ucus ucus;
  Koltuk koltuk;
  late Yolcu yolcu;
  String first = "";
  String last = "";
  late String password = "";
  late String email;
  Kesinlestir({super.key, required this.ucus, required this.koltuk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Bilet Olustur'),
      ),
      body: Column(
        children: [
          //////////////////////////////// Bilgiler ////////////////////////////////////////////////////////
          Row(
            children: [
              MyCard(
                  text: "Ucret : ${koltuk.ucret} TL",
                  color: const Color.fromARGB(255, 0, 150, 122)),
              MyCard(
                  text: "Koltuk : ${koltuk.No}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
              MyCard(
                  text: "Sure : ${ucus.sure}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
            ],
          ),
          Row(
            children: [
              MyCard(
                  text: "Saati : ${ucus.saat}",
                  color: const Color.fromARGB(255, 0, 80, 150)),
              MyCard(
                  text: ucus.formattedDate,
                  color: const Color.fromARGB(255, 0, 80, 150)),
              MyCard(
                  text: "Koltuk : ${koltuk.koltuktipi}",
                  color: const Color.fromARGB(255, 0, 80, 150)),
            ],
          ),
          Row(
            children: [
              MyCard(
                  text: "Ucus No : ${ucus.i * 1433}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
              MyCard(
                  text: "Nerden : ${ucus.nerden}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
            ],
          ),
          Row(
            children: [
              MyCard(
                  text: "Nereye : ${ucus.nereye}",
                  color: const Color.fromARGB(255, 0, 80, 150)),
              MyCard(
                text: "Ucak : ${ucus.ucak.name}",
                color: const Color.fromARGB(255, 0, 80, 150),
              ),
            ],
          ),
          Row(
            children: [
              MyCard(
                  text: "Sirket : ${ucus.ucak.sirketadi}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
              MyCard(
                  text: "Pilot : ${ucus.ucak.pilot.name}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
              MyCard(
                  text: "Ucak : ${ucus.ucak.tip}",
                  color: const Color.fromARGB(255, 0, 150, 122)),
            ],
          ),
          //////////////////////////////// Yolcu Bilgileri formu ////////////////////////////////////////////////////////
          ///
          Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Adjust as needed
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 20, bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.4, // Adjust the width as needed
                      child: TextField(
                        onChanged: (value) {
                          first = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name',
                          hintText: 'Enter first name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 20, bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.4, // Adjust the width as needed
                      child: TextField(
                        onChanged: (value) {
                          last = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last Name',
                          hintText: 'Enter last name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 30),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
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
                    yolcu = Yolcu(first + last);
                    yolcu.email = email;
                    yolcu.password = password;
                    yolcu.biletlerim.add(Bilet(koltuk, ucus, yolcu));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Biletlerim(yolcu: yolcu)));
                  },
                  child: const Text(
                    'Kesinlestir',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
