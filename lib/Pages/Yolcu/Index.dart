import 'package:flutter/material.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

// ignore: must_be_immutable
class Index extends StatelessWidget {
  Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yolcu'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Sefer Bul'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeferBul()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
