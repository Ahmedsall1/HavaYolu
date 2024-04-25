import 'package:havayolu/Classes/User.dart';
import 'package:havayolu/Classes/Ucus.dart';

class Personel extends User {
  late List<Ucus> Ucuslar ;
  Personel(super.name) ;

  @override
  String gettip() {
      return "personel";
  }
}
