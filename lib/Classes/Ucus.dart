// import 'package:havatest/Classes/Hostese.dart';
// import 'package:havatest/Classes/Pilot.dart';
import 'Sefer.dart';
import 'Ucak.dart';
import 'Hostese.dart';
import 'HavaYolu.dart';

class Ucus extends Sefer {
  static int ID = 1;
  late int i;
  late double ucret;
  late Ucak ucak;
  late String saat;

  // Oluşturcu
  Ucus(this.saat, Sefer sefer, this.ucak, double ucret)
      : super(sefer.KM, sefer.nerden, sefer.nereye, sefer.sure, sefer.date,false) {
    i = ID;
    ID++;
    this.ucret = ucret;
    this.ucak.koltukUcreti = ucret;
    for (int i = 1; i < ucak.siraSayisi; i++) {
      // koltuk Ucret belirle
      for (int j = 0; j < ucak.harfSayisi; j++) {
        ucak.kolutkList[i][j].KoltukUcreti(i, ucak.siraSayisi, ucret);
      }
    }
    ucak.pilot.Ucuslar.add(this);
    for (Hostese host in ucak.hosteseList) {
      host.Ucuslar.add(this);
    }
    HavaYolu.UcusList.add(this);
  }
  

  // uçuş bilgileri
  String UcusBilgileri() {
    return "Ucus Sirket Adi: " +
        ucak.sirketadi +
        "Ucak Adi: " +
        ucak.name +
        " Ucus tarihi ve Saati: " +
        formattedDate +
        " Ucus Ucreti: " +
        ucak.koltukUcreti.toString() +
        " TL" +
        " Ucus Mesafesi: " +
        KM.toString() +
        " KM" +
        " Ucus " +
        nerden +
        " > " +
        nereye +
        " Ucus Suresi:" +
        sure +
        " Ucus Koltuk sayisi: " +
        (ucak.kolutkList.length * ucak.kolutkList[0].length).toString() +
        " Ucus bos Koltuk sayisi: " +
        ((ucak.kolutkList.length * ucak.kolutkList[0].length) -
                ucak.koltukSayisi)
            .toString();
  }
}
