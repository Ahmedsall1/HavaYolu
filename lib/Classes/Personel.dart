import 'User.dart';
import 'Ucus.dart';

class Personel extends User {
  late List<Ucus> Ucuslar =[];
  Personel(super.name) ;

  @override
  String gettip() {
      return "personel";
  }
}
