import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/Biletim.dart';
import 'package:havayolu/Pages/Yolcu/Biletlerim.dart';
import 'package:havayolu/Pages/Yolcu/Index.dart';
import 'package:havayolu/Pages/Yolcu/KayitOl.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';

class Kesinlestir extends StatelessWidget {
  Ucus ucus;
  Koltuk koltuk;
  late Yolcu yolcu;
  String first="";
  String last="";
  late String password = "";
  late String email;
  Kesinlestir({super.key, required this.ucus, required this.koltuk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Bilet Olustur'),
      ),
      body: Column(
        children: [
          //////////////////////////////// Bilgiler ////////////////////////////////////////////////////////
          Row(
            children: [
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ucret : " + koltuk.ucret.toString() + " TL"),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Koltuk : " + koltuk.No),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sure : " + ucus.sure),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Saati : " + ucus.saat),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(ucus.formattedDate),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Koltuk : " + koltuk.koltuktipi),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                color: Color.fromARGB(255, 0, 150, 122),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Nerden : " + ucus.nerden),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 0, 150, 122),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ucus No : " + (ucus.i * 1433).toString()),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Nereye : " + ucus.nereye),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 0, 80, 150),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ucak : " + ucus.ucak.name),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                color: Color.fromARGB(255, 0, 150, 122),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sirket : " + ucus.ucak.sirketadi),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 0, 150, 122),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Pilot : " + ucus.ucak.pilot.name),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 0, 150, 122),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ucak : " + ucus.ucak.tip),
                ),
              ),
            ],
          ),
          //////////////////////////////// Yolcu Bilgileri formu ////////////////////////////////////////////////////////
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                    color: Color.fromARGB(255, 0, 150, 122),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    yolcu = Yolcu(first + last);
                    this.yolcu.email = email;
                    this.password = password;
                    this.yolcu.koltuk = this.koltuk.No;
                    yolcu.biletlerim.add(Bilet(koltuk, ucus, yolcu));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Biletlerim(
                                  yolcu: yolcu,
                                  koltuk: koltuk,
                                  ucus: ucus,
                                )));
                  },
                  child: const Text(
                    'Kesinlestir',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
