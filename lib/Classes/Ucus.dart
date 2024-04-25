// import 'package:havayolu/Classes/Hostese.dart';
// import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/HavaYolu.dart';

class Ucus extends Sefer {

    static int ID = 1;
    late int i;
    late double ucret;
    late Ucak ucak;
    late String saat;

    // Oluşturcu 
    Ucus(String saat, Sefer sefer, Ucak ucak, double ucret):super(sefer.KM, sefer.nerden, sefer.nereye, sefer.sure, sefer.date) {
        
        i = ID;
        ID++;
        for(int i = 1; i <ucak.siraSayisi; i++){ // koltuk Ucret belirle
            for(int j=0;j<ucak.harfSayisi;j++){
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
      
        return "Ucus Sirket Adi: " + ucak.sirketadi +
                "Ucak Adi: " + ucak.name +
                " Ucus tarihi ve Saati: " + formattedDate +
                " Ucus Ucreti: " + ucak.koltukUcreti.toString() + " TL" +
                " Ucus Mesafesi: " + KM.toString() + " KM" +
                " Ucus " + nerden + " > " + nereye +
                " Ucus Suresi:" + sure +
                " Ucus Koltuk sayisi: " + (ucak.kolutkList.length * ucak.kolutkList[0].length).toString() +
                " Ucus bos Koltuk sayisi: " + ((ucak.kolutkList.length * ucak.kolutkList[0].length) - ucak.koltukSayisi).toString();
    }
}
