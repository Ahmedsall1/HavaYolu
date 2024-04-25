import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Classes/Yolcu.dart';

class Ucak {
  static int ID = 1;
  static bool iss = false;
  late int id;
  late String name;
  // late Koltuk kolutkList[][];
  late List<Hostese> hosteseList;
  late Pilot pilot;
  late String sirketadi;
  late String tip;
  late int harfSayisi;
  late int siraSayisi;
  late double koltukUcreti;
  late int koltukSayisi;
  late List<List<Koltuk>> kolutkList;
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
  Ucak(this.tip, this.name, Pilot pilot, Hostese hostes, String sirketadi) {
    sayisi(tip);
    id = ID;
    ID++;
    hosteseList.add(hostes);

    for (int i = 0; i < siraSayisi; i++) {
      kolutkList.add(
        List<Koltuk>.generate(
          harfSayisi,
          (index) => Koltuk(
              i, String.fromCharCode(index + 65), siraSayisi, koltukUcreti),
          growable: false,
        ),
      );
    }
    bool a = false;
    for (Sirket sirket in HavaYolu.SirketiList) {
      if (sirket.name == sirketadi) {
        sirket.ucakList.add(this);
        a = true;
      }
    }
    if(a==false){
      new Sirket(sirketadi, this);
    }
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
