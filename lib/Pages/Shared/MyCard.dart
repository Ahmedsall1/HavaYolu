// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  late String text;
  late Color color;
  Color? txtcolor;
  MyCard({super.key, required this.text, required this.color, this.txtcolor}) {
    txtcolor ??= Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            color: txtcolor,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
