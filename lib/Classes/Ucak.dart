import 'package:havayolu/Classes/Personel.dart';

// import 'Pilot.dart';
import 'Koltuk.dart';
// import 'Hostese.dart';
import 'HavaYolu.dart';
import 'Sirket.dart';
import 'Yolcu.dart';

class Ucak {
  static int ID = 1;
  static bool iss = false;
  late int id;
  late String name = "";
  // late Koltuk kolutkList[][];
  late List<Personel> hosteseList = [];
  late Personel pilot;
  late String tip;
  late int harfSayisi;
  late int siraSayisi;
  late double koltukUcreti;
  late int koltukSayisi;
  late Sirket sirket;
  late List<List<Koltuk>> kolutkList = [];
  // Koltuk saysi Uçak tip göre sırala
  void sayisi(String tip) {
    this.tip = tip;
    if (tip == HavaYolu.UcakTipi[0]) {
      siraSayisi = 18;
      harfSayisi = 4;
    } else if (tip == HavaYolu.UcakTipi[1]) {
      siraSayisi = 18;
      harfSayisi = 6;
    } else if (tip == HavaYolu.UcakTipi[2]) {
      siraSayisi = 30;
      harfSayisi = 6;
    }
  }

  // bilgiler al
  Ucak(this.tip, this.name, this.pilot, Personel hostes, Sirket sirket) {
    sayisi(tip);
    id = ID;
    ID++;
    koltukSayisi = harfSayisi * siraSayisi;
    hosteseList.add(hostes);

    for (int i = 0; i < siraSayisi; i++) {
      kolutkList.add(
        List<Koltuk>.generate(
          harfSayisi,
          (index) => Koltuk(i, String.fromCharCode(index + 65), siraSayisi, 0),
          growable: false,
        ),
      );
    }

    sirket.ucakList.add(this);
    this.sirket = sirket;

    HavaYolu.UcakList.add(this);
  }
  // koltuk seç
  bool Koltuksec(int sira, int koltuk, Yolcu yolcu) {
    if (kolutkList[sira][koltuk].durum == false) {
      koltukSayisi++;
      yolcu.sira = sira;
      yolcu.harf = koltuk;
      kolutkList[sira][koltuk].durum = true;
      kolutkList[sira][koltuk].yolcu = yolcu;
      return true;
    } else {
      print("Koltuk Dolu !!!");
      return false;
    }
  }

  void inis() {
    for (int i = 1; i < kolutkList.length; i++) {
      for (int j = 0; j < kolutkList[0].length; j++) {
        kolutkList[i][j].durum = false;
        kolutkList[i][j].yolcu = null;
        kolutkList[i][j].ucret = 0;
      }
    }
    koltukSayisi = 0;
  }
}
