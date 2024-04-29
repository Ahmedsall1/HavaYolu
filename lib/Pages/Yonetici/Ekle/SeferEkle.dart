import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Seferler.dart';

class SeferEkle extends StatefulWidget {
  const SeferEkle({Key? key}) : super(key: key);

  @override
  _SeferEkle createState() => _SeferEkle();
}

class _SeferEkle extends State<SeferEkle> {
  String nerden = HavaYolu.Airports[0];
  String nereye = HavaYolu.Airports[2];
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String sure = HavaYolu.Saat[1];
  late int km;
  late DateTime selectedDate = DateTime.now();
  late DateTime nextYear = selectedDate.add(const Duration(days: 365));
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime.now(),
        lastDate: nextYear);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = selectedDate;
        print(date);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sefer Ekle'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: HavaYolu.Airports[0],
                dropdownBuilder: (context, sleectedItem) {
                  nerden = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: HavaYolu.Airports,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: HavaYolu.Airports[1],
                dropdownBuilder: (context, sleectedItem) {
                  nereye = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: HavaYolu.Airports,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                selectedItem: HavaYolu.Saat[1],
                dropdownBuilder: (context, sleectedItem) {
                  sure = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: HavaYolu.Saat,
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: TextField(
                onChanged: (value) {
                  km = int.parse(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'KM',
                    hintText: 'KM'),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 150, 122),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Sefer(km, nerden, nereye, sure, date, true);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Seferler()));
                },
                child: Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
        // child: ElevatedButton(
        //   child: const Text('Yonetici'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const KoltukSec()),
        //     );
        //   },
        // ),
      ),
    );
  }
}
