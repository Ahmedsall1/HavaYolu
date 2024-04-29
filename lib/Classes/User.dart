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
    
    password =name;
    if(gettip()!=("Yolcu"))
        HavaYolu.UserList.add(this);
        email = name + "@gmail.com";
  }
  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }

  int getId() {
    return id;
  }

  String gettip();
}
