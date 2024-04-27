import 'Yolcu.dart';

class Koltuk {

    late var No;
    late double ucret;
    bool durum = false;
    late Yolcu? yolcu;
    String koltuktipi = tipi[1];
    static List<String> tipi = [ "Business", "Standart", "Ekonomik" ];

    // uçak tipi göre sıralama
    void KoltukUcreti(int sira,int toplamsira , double ucret){
        if(sira<=(toplamsira*1/3).toInt()) {  
            koltuktipi=tipi[1]; 
            this.ucret=ucret;
        }
        else if(sira<=(toplamsira*2/3).toInt() && sira> (toplamsira*1/3).toInt()){
            koltuktipi=tipi[2]; 
            this.ucret=ucret-ucret*1/5;
        }
        else{
            koltuktipi=tipi[0];
            this.ucret=ucret+ucret*1/5;
        }
    }
    // Bilgiler Al ve Koltuk tip Belirle
    Koltuk(int sira,var harf ,int toplamsira,this.ucret) {
        KoltukUcreti(sira, toplamsira, ucret);
        No=sira.toString() + harf.toString();
    }

}
