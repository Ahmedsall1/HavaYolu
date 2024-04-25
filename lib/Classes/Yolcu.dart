import 'package:havayolu/Classes/Ucus.dart';
import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Classes/HavaYolu.dart';

class Yolcu extends User{

    static var tip=["Standart", "VIP"];
    late String Ytip=tip[0];
    late int sira , harf;
    late List<Ucus> ucuslar;
    late List<String> Koltuklar;
    late String Koltuk;

    Yolcu(super.name){
        HavaYolu.YolcuList.add(this);
    }

    @override
    String gettip(){
        return "Yolcu";    
    }
}