

import 'Ucus.dart';
import 'User.dart';
import 'HavaYolu.dart';
import 'Koltuk.dart';

class Yolcu extends User {
  static var tip = ["Standart", "VIP"];
  String Ytip = tip[0];
  late int sira, harf;
  late List<Ucus> ucuslar = [];
  late List<Koltuk> Koltuklar = [];
  String koltuk="";
  late String email;

  Yolcu(super.name) {
    HavaYolu.YolcuList.add(this);
    email = name + "@gmail.com";
  }
  void git(Ucus ucus, Koltuk kol) {
    ucuslar.add(ucus);
    Koltuklar.add(kol);
    koltuk = kol.No;
  }

  @override
  String gettip() {
    return "Yolcu";
  }
}
