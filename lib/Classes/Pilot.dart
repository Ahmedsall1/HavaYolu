import 'Personel.dart';

class Pilot extends Personel {
  
  Pilot(super.name);

  @override
  String gettip() {
    return "Pilot";
  }
}
