// ignore_for_file: file_names, non_constant_identifier_names

import 'HavaYolu.dart';

abstract class User {
  static int ID = 1; // Her Kolanıcı için farklı bir ID verilmektedir
  late int id;
  String name;
  late String password;
  late String email;

  User(this.name) {
    id = ID;
    ID++;

    password = name;
    email = "$name@gmail.com";
    if (gettip() != ("Yolcu")) {
      HavaYolu.UserList.add(this);
    }
  }
  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  int getId() {
    return id;
  }

  String gettip();
}
