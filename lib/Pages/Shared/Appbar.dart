// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Pages/Shared/Hisabim.dart';

// ignore: must_be_immutable
class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  late User user;

  // ignore: use_super_parameters
  Appbar({Key? key, required this.title, required this.user}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 0, 80, 150),
          fontFamily: "Times New Roman",
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.person,
            color: Color.fromARGB(255, 0, 80, 150),
          ),
          tooltip: 'Hisabim',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Hisabim(user: user)));
          },
        ),
      ],
    );
  }
}
