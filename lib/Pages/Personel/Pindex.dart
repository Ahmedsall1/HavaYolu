import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/User.dart';
import "package:havayolu/Pages/Personel/Sorgula.dart";

class Pindex extends StatelessWidget {
  late String email = "";
  late String password = "";
  Pindex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel'),
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
                  bool t = false;
                  int i = 0;
                  for (User per in HavaYolu.PersonelList) {
                    if (per.email == email && per.password == password) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Sorgula(id: per.id, listId: i)));
                      t = true;
                      break;
                    }
                    i++;
                  }
                  if (!t) {
                    _showDialog(context);
                  }
                },
                child: Text(
                  'Sorgula',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
        // child: ElevatedButton(
        //     child: const Text('Sorgula'),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const Sorgula()),
        //       );
        //     }),
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
