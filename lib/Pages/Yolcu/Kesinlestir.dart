import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:havayolu/Classes/Bilet.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
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
        title: const Text(
          'Bilet Oluştur',
          style: TextStyle(
            color: Color(0xFF005096),
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          //////////////////////////////// Bilgiler ////////////////////////////////////////////////////////
          ///
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                  text: "Ucret : ${koltuk.ucret} TL",
                  color: const Color(0xFFFDDE55)),
              MyCard(
                  text: "Koltuk : ${koltuk.No}",
                  color: const Color(0xFFFDDE55)),
              MyCard(
                  text: "Sure : ${ucus.sure}", color: const Color(0xFFFDDE55)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                text: "Saati : ${ucus.saat}",
                color: const Color.fromARGB(255, 0, 80, 150),
                txtcolor: Colors.white,
              ),
              MyCard(
                text: ucus.formattedDate,
                color: const Color.fromARGB(255, 0, 80, 150),
                txtcolor: Colors.white,
              ),
              MyCard(
                text: "Koltuk : ${koltuk.koltuktipi}",
                color: const Color.fromARGB(255, 0, 80, 150),
                txtcolor: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                  text: "Ucus No : ${ucus.i * 1433}",
                  color: const Color(0xFFFDDE55)),
              MyCard(
                  text: "Nerden : ${ucus.nerden}",
                  color: const Color(0xFFFDDE55)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                text: "Nereye : ${ucus.nereye}",
                color: const Color.fromARGB(255, 0, 80, 150),
                txtcolor: Colors.white,
              ),
              MyCard(
                text: "Ucak : ${ucus.ucak.name}",
                color: const Color.fromARGB(255, 0, 80, 150),
                txtcolor: Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              MyCard(
                text: "Sirket : ${ucus.ucak.sirket.name}",
                color: const Color(0xFFFDDE55),
              ),
              MyCard(
                  text: "Pilot : ${ucus.ucak.pilot.name}",
                  color: const Color(0xFFFDDE55)),
              MyCard(
                  text: "Ucak : ${ucus.ucak.tip}",
                  color: const Color(0xFFFDDE55)),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          //////////////////////////////// Yolcu Bilgileri formu ////////////////////////////////////////////////////////
          ///
          ///
          Card(
            color: const Color.fromARGB(255, 0, 80, 150),
            elevation: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                              labelText: 'ADI',
                              hintText: 'Adınız Giriniz',
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
                              labelText: 'SOYADI',
                              hintText: 'Soyadınız Giriniz',
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
                        hintText: 'Öğrnek: abc@gmail.com',
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
                        labelText: 'ŞİFRE',
                        hintText: 'Şifreye Giriniz',
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
                        bool v = true;
                        if (first != "" &&
                            last != "" &&
                            email != "" &&
                            password != "") {
                          for (Yolcu yolcu in HavaYolu.YolcuList) {
                            if (email == yolcu.email &&
                                password == yolcu.password) {
                              yolcu.biletlerim.add(Bilet(koltuk, ucus, yolcu));
                              koltuk.durum = true;
                              v = false;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          Biletlerim(yolcu: yolcu)));
                            } else {
                              print("object");
                            }
                          }
                          if (v) {
                            yolcu = Yolcu("$first $last");
                            yolcu.email = email;
                            yolcu.password = password;
                            yolcu.biletlerim.add(Bilet(koltuk, ucus, yolcu));
                            koltuk.durum = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Biletlerim(yolcu: yolcu)));
                          }
                        } else {
                          _showDialog(context);
                        }
                      },
                      child: const Text(
                        'Kesinleştir',
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
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF005096),
          title: const Text(
            'Hata',
            style: TextStyle(
              color: Color(0xFFFDDE55),
              fontSize: 20.0,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Bilgiler Eksik !',
            style: TextStyle(
              color: Color(0xFFFDDE55),
              fontSize: 14.0,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'iptal',
                style: TextStyle(
                  color: Color(0xFFFDDE55),
                  fontSize: 16.0,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
