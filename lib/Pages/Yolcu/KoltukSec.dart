import 'package:flutter/material.dart';
import 'package:havayolu/Pages/Yolcu/Bilet.dart';

class KoltukSec extends StatelessWidget {
  const KoltukSec({super.key});

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