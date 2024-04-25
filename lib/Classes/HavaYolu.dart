import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Classes/Sirket.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Classes/Hostese.dart';


class HavaYolu {

    static var UcakTipi = [ "Kucuk", "Orta", "Buyuk" ];
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


    static List<Sirket> SirketiList =[Sirket("Air", UcakList[1])];
    static List<User> PersonelList =[Pilot("Ahmed"),Hostese("Fatma")];
    static List<Yolcu> YolcuList =[Yolcu("Air")];
    static List<Sefer> SeferList =[Sefer(40,HavaYolu.Airports[1],HavaYolu.Airports[2],"12:30",DateTime.now())]; 
    static List<Ucak> UcakList =[Ucak(UcakTipi[1], "AnadoluJet", Pilot("Ahmed S"), Hostese("Fatma"), "Anadol")];
    static List<Ucus> UcusList =[Ucus("12:30", SeferList[1], UcakList[1], 400)];

    void SetSefer(int No, var KM, String nerden, String nereye, String sure, DateTime date) {
        SeferList.add(Sefer(KM, nerden, nereye, sure, date));
    }

    void SetSeferFul(Sefer sefer) {
        SeferList.add(Sefer(sefer.KM, sefer.nerden, sefer.nereye, sefer.sure, sefer.date));
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
        Pilot pilot = new Pilot("Ahmed");
        Hostese host = new Hostese("Fatma");
        Ucak ucak = new Ucak(HavaYolu.UcakTipi[1], "AirJet", pilot, host, "AnadoluJet");
        Yolcu yolcu = new Yolcu("Muhammed");
        ucak.kolutkList[2][2].yolcu=yolcu;
        ucak.kolutkList[2][2].durum=true;
        ucak.kolutkList[3][3].durum=true;
        yolcu.Koltuk=ucak.kolutkList[2][2].No;
        for(int j=1;j<ucak.siraSayisi;j++){
            for(int k=0;k<ucak.harfSayisi;k++){
                    if(k>=2 && k<5)
                        ucak.kolutkList[j][k].durum=true;
            }
        }
        int i = 100;
        for (String airport in HavaYolu.Airports) {
            i++;
            
            Sefer sefer = new Sefer(i, airport, HavaYolu.Airports[0], saat.toString(), date);
            
            Ucus(saat.toString(), sefer, ucak,400);
            Sirket("AirPort" + i.toString(), ucak);
            Ucak(HavaYolu.UcakTipi[1], "AnadoluJet", pilot, host, "AirPort");
            Yolcu(airport);

        }
    }

}