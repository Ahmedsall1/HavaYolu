import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';

import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/Biletlerim.dart';

class Sorgula extends StatelessWidget {
  late String email = "";
  late String password = "";
  Sorgula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yolcu Girişi ',style: TextStyle(color: Color.fromARGB(255, 0, 80, 150),fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w600,),),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                  color: Color(0xFFFDDE55),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  bool t = false;
                  int i = 0;
                  for (Yolcu per in HavaYolu.YolcuList) {
                    if (per.email == email && per.password == password) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Biletlerim(
                                    yolcu: per,
                                  )));
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
                  'Sorgula',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 80, 150),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text('Yanlış Bilgiler !'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
