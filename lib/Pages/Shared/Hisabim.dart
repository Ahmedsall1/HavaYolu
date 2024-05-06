// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:havayolu/Classes/User.dart';


class Hisabim extends StatelessWidget {
  late User user;

  Hisabim({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hisabim'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("${user.id}"),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // ignore: unnecessary_string_interpolations
                  child: Text("${user.name}"),
                ),
              ),
              Card(
                color: Colors.teal,
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // ignore: unnecessary_string_interpolations
                  child: Text("${user.email}"),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
