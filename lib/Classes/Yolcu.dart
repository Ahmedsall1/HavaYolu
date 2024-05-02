import 'package:havayolu/Classes/Bilet.dart';
import 'User.dart';
import 'HavaYolu.dart';

class Yolcu extends User {
  static var tip = ["Standart", "VIP"];
  String Ytip = tip[0];
  late int sira, harf;
  List<Bilet> biletlerim = [];
  String koltuk = "";

  Yolcu(super.name) {
    HavaYolu.YolcuList.add(this);
  }

  @override
  String gettip() {
    return "Yolcu";
  }
}
