// ignore_for_file: non_constant_identifier_names, file_names

import 'Ucak.dart';
import 'Personel.dart';
import 'Ucus.dart';
import 'HavaYolu.dart';
import 'package:flutter/material.dart';

class Sirket {
  static int ID = 1;
  late int id;
  late String name;
  late Personel yonetici;
  late List<Ucak> ucakList = []; // her Şirketin uçakların listesi verdır
  late List<Ucus> ucusList = []; // her Şirketin uçuşların listesi verdır
  late Image logo;

  // set get methodlar
  String SirketinAdi() {
    return name;
  }

  String gettip() {
    return "Sirket";
  }

  void ucakEkle(Ucak ucak) {
    ucakList.add(ucak);
  }

  void ucakEklelist(List<Ucak> ucak) {
    ucakList.addAll(ucak);
  }

  void ucusEkle(Ucus ucus) {
    ucusList.add(ucus);
  }

  void setName(String name) {
    this.name = name;
  }

  // Oluşturcu
  Sirket(this.name) {
    id = ID;
    ID++;
    logo = Image.asset('images/Sirket/$name.png',height: 30,width: 30,);
    bool ar = false;
    for (Sirket sirket in HavaYolu.SirketiList) {
      if (sirket.name == name) {
        ar = true;
        break;
      }
    }
    if (!ar) HavaYolu.SirketiList.add(this);
  }
}
