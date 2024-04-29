import 'package:flutter/material.dart';
// import 'package:havayolu/Pages/Yolcu/KoltukSec.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Classes/Hostese.dart';
import 'package:havayolu/Classes/Pilot.dart';
import 'package:havayolu/Pages/Yonetici/Dashboard/Personeller.dart';

class PersonelEkle extends StatelessWidget {
  String name = "";
  late String gorev;
  List<String> tip = ["Pilot", "Hostese"];
  PersonelEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Ekle'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 30),
              child: DropdownSearch<String>(
                
                selectedItem: "Pilot",
                dropdownBuilder: (context, sleectedItem) {
                  
                  gorev = sleectedItem.toString();
                  return Text(sleectedItem.toString());
                },
                items: tip,
                
                popupProps: PopupProps.bottomSheet(
                  
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
                  name = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Personel Adi Giriniz'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 150, 122),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (name != "") {
                    if (gorev == tip.first) {
                      Pilot(name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Personeller()));
                    }
                    else if (gorev == tip[1]){
                      Hostese(name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Personeller()));
                    }
                  } else {
                    _showDialog(context);
                  }
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text('Lutfan Personel Adi Giriniz !'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
