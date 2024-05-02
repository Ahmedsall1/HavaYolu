import 'package:flutter/material.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Shared/Hisabim.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  late User user;

  Appbar({Key? key, required this.title, required this.user})
      : super(key: key) {}

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
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
