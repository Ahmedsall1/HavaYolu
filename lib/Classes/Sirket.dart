import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Personel.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/HavaYolu.dart';

class Sirket {
    
    static int ID=1; 
    late int id;
    late String name;  
    late Personel yonetici ;
    late List<Ucak> ucakList ;// her Şirketin uçakların listesi verdır
    late List<Ucus> ucusList ;// her Şirketin uçuşların listesi verdır
    
    // set get methodlar
    String SirketinAdi() {return name;}
    String gettip(){ return "Sirket";}
    void ucakEkle(Ucak ucak) { ucakList.add(ucak);}
    void ucakEklelist(List<Ucak> ucak) { ucakList.addAll(ucak);}
    void ucusEkle(Ucus ucus) { ucusList.add(ucus);}
    void setName(String name) {this.name=name;}
    // Oluşturcu
    Sirket(String name,Ucak ucak) { 
        id=ID;
        ID++;
        ucakList.add(ucak);
        bool ar = false;
        for(Sirket sirket in HavaYolu.SirketiList){
            if(sirket.name==name){
                ar=true;  break;
            }
        }
        if(!ar)
            HavaYolu.SirketiList.add(this);
    }
}
