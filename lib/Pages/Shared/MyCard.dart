import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  late String text ;
  late Color color;

  MyCard({super.key, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(text),
      ),
    );
  }
}
