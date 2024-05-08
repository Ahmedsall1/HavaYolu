// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';

import 'package:havayolu/Classes/User.dart';
import "package:havayolu/Pages/Personel/Sorgula.dart";

// ignore: must_be_immutable
class Pindex extends StatelessWidget {
  late String email = "";
  late String password = "";
  Pindex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 120.0,
            ),
            Image.asset(
              'images/LeftLogo.png',
              height: 50,
              width: 150,
            ),
          ],
        ),
        Card(
          color: const Color.fromARGB(255, 0, 80, 150),
          elevation: 20.0,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                     Text(
                      'Personel Girişi',
                      style: TextStyle(
                        color: Color.fromRGBO(253, 222, 85, 1),
                        fontSize: 25,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/Pilot.png',
                      width: 150,
                      height: 150,
                    ),
                    Image.asset(
                      'images/Hostese.png',
                      width: 150,
                      height: 120,
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
                      hintText: 'örnek: abc@gmail.com',
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
                      labelText: 'Şifre',
                      hintText: 'en az 8 karekter !',
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
                      bool t = false;
                      int i = 0;
                      for (User per in HavaYolu.PersonelList) {
                        if (per.email == email && per.password == password) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      Sorgula(id: per.id, listId: i)));
                          t = true;
                          break;
                        }
                        i++;
                      }
                      if (!t) {
                        _showDialog(context);
                      }
                    },
                    child: const Text(
                      'Giriş',
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
      ]),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: const Text('Yanlış Bilgiler !'),
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
