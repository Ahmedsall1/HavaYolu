// ignore_for_file: file_names, non_constant_identifier_names

import 'package:havayolu/Classes/Personel.dart';

import 'Yolcu.dart';
import 'Sirket.dart';
import 'User.dart';
import 'Sefer.dart';
import 'Ucak.dart';
import 'Ucus.dart';
import 'Pilot.dart';
import 'Hostese.dart';

class HavaYolu {
  static List<String> Saat = [
    "00:30",
    "01:00",
    "01:30",
    "02:00",
    "02:30",
    "03:00",
    "03:30",
    "04:00",
    "04:30",
    "05:00",
    "05:30",
    "06:00",
    "06:30",
    "07:00",
    "07:30",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00",
    "20:30",
    "21:00",
    "21:30",
    "22:00",
    "22:30",
    "23:00",
    "23:30",
    "00:00"
  ];
  static var UcakTipi = ["Kucuk", "Orta", "Buyuk"];
  static var Airports = [
    // region bilgi
    "Istanbul Airport",
    "Adana Airport",
    "Ankara Esenboga Airport",
    "Gazipasa Airport",
    "Antalya Airport",
    "Balikesir Koca Seyit Airport",
    "Bursa Yenisehir Airport",
    "Denizli Cardak Airport",
    "Diyarbakir Airport",
    "Elazig Airport",
    "Erzurum Airport",
    "Eskisehir Hasan Polatkan Airport",
    "Gaziantep Airport",
    "Hatay Airport",
    "Isparta Suleyman Demirel Airport",
    "Istanbul Sabiha Gokcen Airport",
    "Izmir Adnan Menderes Airport",
    "Kars Harakani Airport",
    "Kayseri Airport",
    "Kocaeli Cengiz Topel Airport",
    "Konya Airport",
    "Zafer Airport",
    "Malatya Airport",
    "Dalaman Airport",
    "Milas–Bodrum Airport",
    "Nevsehir Kapadokya Airport",
    "Ordu Giresun Airport",
    "Samsun-Carsamba Airport",
    "Sinop Airport",
    "Sivas Nuri Demirag Airport",
    "Sanliurfa GAP Airport",
    "Tekirdag Corlu Airport",
    "Trabzon Airport",
    "Van Ferit Melen Airport",
    "Zonguldak Caycuma Airport",
    "Adiyaman Airport",
    "Agri Ahmed-i Hani Airport",
    "Amasya Merzifon Airport",
    "Aydin Cildir Airport",
    "Balikesir Merkez Airport",
    "Batman Airport",
    "Bingol Airport",
    "Canakkale Airport",
    "Gokceada Airport",
    "Erzincan Airport",
    "Hakkari–Yuksekova Selahaddin Eyyubi Airport",
    "Igdir Airport",
    "Istanbul Hezarfen Airfield",
    "Selcuk–Efes Airport",
    "Kahramanmaras Airport",
    "Kastamonu Airport",
    "Mardin Airport",
    "Mus Airport",
    "Rize-Artvin Airport",
    "Siirt Airport",
    "Sirnak Serafettin Elci Airport",
    "Tokat Airport",
    "Usak Airport",
    "İncirlik Air Base",
    "Afyon Airport",
    "Merzifon Air Base",
    "Etimesgut Air Base",
    "Guvercinlik Army Air Base",
    "Murted Air Base",
    "Balikesir Air Base",
    "Bandirma Air Base",
    "Bursa Yunuseli Airport",
    "Diyarbakir Air Base",
    "Kesan Army Air Base",
    "Eskisehir Air Base",
    "Sivrihisar Air Base",
    "Istanbul Samandira Army Air Base",
    "Cigli Air Base",
    "Gaziemir Army Air Base",
    "Kaklic Air Base",
    "Erkilet Air Base",
    "Cengiz Topel Naval Air Station",
    "Konya Air Base",
    "Kutahya Air Base",
    "Erhac Air Base",
    "Malatya Tulga Army Air Base",
    "Akhisar Air Base",
    "Bodrum-Imsik Airport",
    "Yalova Air Base",
    "Cukurova Regional Airport",
    "Kas-Demre Bati Antalya Airport",
    "Tatvan Airport",
    "Edirne-Kirklareli Airport",
    "Cesme-Alacati Airport",
    "Gumushane-Bayburt Airport",
    "Karaman Airport",
    "Cukurova Regional Airport",
    "Hasandagi (Nigde Aksaray) Airport",
    "Yozgat Airport"
    // endregion bilgi
  ];

  static List<Sirket> SirketiList = [];
  static List<Personel> PersonelList = [];
  static List<Yolcu> YolcuList = [];
  static List<Sefer> SeferList = [];
  static List<User> UserList = [];
  static List<Ucak> UcakList = [];
  static List<Ucus> UcusList = [];

  static List<Ucus> ucuslar(String nerden, String nereye, DateTime time) {
    List<Ucus> ucuslar = [];
    for (Ucus ucus in UcusList) {
      if (ucus.nerden == nerden && ucus.nereye == nereye && ucus.date == time) {
        ucuslar.add(ucus);
      }
    }
    return ucuslar;
  }

  static Ucus GetUcus(int id) {
    Ucus ucus1 = UcusList[0];
    for (Ucus ucus in UcusList) {
      if (id == ucus.i) {
        return ucus;
      }
    }
    return ucus1;
  }

  void SetSefer(
      var KM, String nerden, String nereye, String sure, DateTime date) {
    SeferList.add(Sefer(KM, nerden, nereye, sure, date, true));
  }

  void SetSeferFul(Sefer sefer) {
    SeferList.add(Sefer(
        sefer.KM, sefer.nerden, sefer.nereye, sefer.sure, sefer.date, true));
  }

  void setSirket(Sirket sirket) {
    SirketiList.add(sirket);
  }

  void UcusListesiEkle(List<Ucus> ucusList) {
    UcusList.addAll(ucusList);
  }

  void UcusEkle(Ucus ucus) {
    UcusList.add(ucus);
  }

  static void create() {
    var saat = DateTime.now().hour;
    DateTime date = DateTime.now();
    Pilot pilot = Pilot("Ahmed");
    Hostese host = Hostese("Fatma");
    Ucak ucak = Ucak(HavaYolu.UcakTipi[1], "AirJet", pilot, host, Sirket("AnadoluJet"));
    // Yolcu yolcu =  Yolcu("Muhammed");
    // ucak.kolutkList[2][2].yolcu = yolcu;
    // ucak.kolutkList[2][2].durum = true;
    // ucak.kolutkList[3][3].durum = true;
    // yolcu.Koltuk = ucak.kolutkList[2][2].No;
    for (int j = 1; j < ucak.siraSayisi; j++) {
      for (int k = 0; k < ucak.harfSayisi; k++) {
        if (k >= 2 && k < 5) ucak.kolutkList[j][k].durum = true;
      }
    }
    int i = 100;
    for (String airport in HavaYolu.Airports) {
      i++;

      Sefer sefer =
          Sefer(i, airport, HavaYolu.Airports[0], saat.toString(), date, true);

      Ucus(saat.toString(), sefer, ucak, 400);
      // Sirket("AirPort" + i.toString(), ucak);
      Ucak(HavaYolu.UcakTipi[1], "AnadoluJet", pilot, host, Sirket("AirPort"));
      Yolcu(airport);
    }
  }
}
