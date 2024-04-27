import 'package:intl/intl.dart';
import 'HavaYolu.dart';

class Sefer {
  static int No = 100;
  bool sefer = false;
  late int no;
  late int KM;
  late String nerden;
  late String nereye;
  late String sure;
  late DateTime date;
  late String formattedDate;
  // 1 Oluşturcu
  Sefer(this.KM, this.nerden, this.nereye, this.sure, this.date,this.sefer) {
    DateFormat myFormat = DateFormat('yyyy-MM-dd');
    formattedDate = myFormat.format(date);

    if (sefer) {
      HavaYolu.SeferList.add(this);
    }
    // 2 Oluşturcu
    // Sefer.Two(this.KM, this.nerden, this.nereye, this.sure, this.date) {
    //     DateTime timeFormatter = DateTime.ofPattern("HH:mm");
    //     DateTime sure1 = DateTime.parse(sure, timeFormatter);

    //         DateTime dateFormatter = DateTime.ofPattern("yyyy-MM-dd");
    //         DateTime date1 = DateTime.parse(date, dateFormatter);
    //         new Sefer(KM, nerden, nereye, sure1, date1);

    //         formattedDate = date;
    //         no = No;
    //         No++;
    //         if (this.runtimeType.toString() == ToString()) {
    //         HavaYolu.SeferList.add(this);
    //         }
    // }
  }
}
