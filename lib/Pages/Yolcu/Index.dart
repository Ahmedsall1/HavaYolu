import 'package:flutter/material.dart';
import 'package:havayolu/Pages/Yolcu/SeferBul.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yolcu'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sefer Bul'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SeferBul()),
            );
          },
        ),
      ),
    );
  }
}