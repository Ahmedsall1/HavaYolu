import 'package:havayolu/Classes/HavaYolu.dart';

import 'User.dart';
import 'Ucus.dart';

class Personel extends User {
  late List<Ucus> Ucuslar =[];
  Personel(super.name) {
    HavaYolu.PersonelList.add(this);
  }

  @override
  String gettip() {
      return "personel";
  }
  
}
