import 'package:flutter/material.dart';
import 'package:havayolu/Pages/Yolcu/Bilet.dart';

class KoltukSec extends StatelessWidget {
  int id;
  KoltukSec({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koltuk Sec'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Bilet'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Bilet()),
            );
          },
        ),
      ),
    );
  }
}
