import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Yolcu.dart';

class Bilet {
  static int ID = 1;
  late int id;
  late Koltuk koltuk;
  late Ucus ucus;
  late Yolcu yolcu;
  Bilet(this.koltuk, this.ucus, this.yolcu) {
    id = ID;
    ID++;
  }
  String koltukBilgiler() {
    return "NO: ${koltuk.No} Ucret: ${koltuk.ucret}";
  }

  String yolcuBilgiler() {
    return "Yolcu Adi: ${yolcu.name}";
  }

  String ucusBilgiler() {
    return "Nerden: ${ucus.nerden} Nereye: ${ucus.nereye}\n Saati: ${ucus.saat} Tarihi: ${ucus.formattedDate} KM${ucus.KM} U Adi: ${ucus.ucak.name}";
  }
}
