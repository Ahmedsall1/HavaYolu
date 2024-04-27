import 'Ucus.dart';
import 'User.dart';
import 'HavaYolu.dart';

class Yolcu extends User {
  static var tip = ["Standart", "VIP"];
  late String Ytip = tip[0];
  late int sira, harf;
  late List<Ucus> ucuslar = [];
  late List<String> Koltuklar = [];
  late String Koltuk;
  late String email;

  Yolcu(super.name) {
    HavaYolu.YolcuList.add(this);
    email = name + "@gmail.com";
  }

  @override
  String gettip() {
    return "Yolcu";
  }
}
