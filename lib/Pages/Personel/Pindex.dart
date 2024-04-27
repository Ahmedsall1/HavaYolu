import 'package:flutter/material.dart';
import "package:havayolu/Pages/Personel/Sorgula.dart";

class Pindex extends StatelessWidget {
  const Pindex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Sorgula'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sorgula()),
              );
            }),
      ),
    );
  }
}
