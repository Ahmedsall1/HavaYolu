import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class KayitOl extends StatelessWidget {
  late Yolcu yolcu;
  String first = "";
  String last = "";
  late String password = "";
  late String email;
  KayitOl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kayit Ol'),
        ),
        body: Column(
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

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SeferBul()));
                },
                child: const Text(
                  'Kesinlestir',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ));
  }
}
