import 'User.dart';

class Yonetici extends User {
  //  HavaYolu havayolu=new HavaYolu();
  static Yonetici yonet =  Yonetici("Ahmed Salih");

  Yonetici(super.name);
  @override
  String gettip() {
    return "Yonetici";
  }

  static Yonetici getYonet() {
    return yonet;
  }
}
