// package havayolubilgisistemi;
import 'package:havayolu/Classes/HavaYolu.dart';
abstract class User {
    
    static int ID=1; // Her Kolanıcı için farklı bir ID verilmektedir
    late int id;
    String name;
    User(this.name ) {
        id=ID;
        ID++;
        if(gettip()!=("Yolcu"))
            HavaYolu.PersonelList.add(this);
    }
    String getName() {return this.name;}
    void setName(String name) {this.name=name;}
      int getId() {return id;}  

      String gettip();

}
