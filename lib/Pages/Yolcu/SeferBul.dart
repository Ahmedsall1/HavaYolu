import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:havayolu/Pages/Yolcu/UcusSec.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Sefer.dart';

var nerden = " ";
var nereye = " ";
DateTime tarih = DateTime.now();

class SeferBul extends StatefulWidget {
  const SeferBul({Key? key}) : super(key: key);

  @override
  _SeferBulState createState() => _SeferBulState();
}

class _SeferBulState extends State<SeferBul> {
  late DateTime selectedDate = DateTime.now();
  late DateTime nextYear =
      selectedDate.add(const Duration(days: 365)); // Adding one year
  String dropdownValue = HavaYolu.Airports[0];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: nextYear);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tarih = selectedDate;
        print(tarih);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sefer Bul'),
      ),
      body: Center(
        child: Column(
          children: [
            // const Nerden(),
            // const Nereye(),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(
              height: 20.0,
            ),
            DropdownSearch<String>(
              selectedItem: HavaYolu.Airports[0],
              dropdownBuilder: (context, sleectedItem) {
                nerden = sleectedItem.toString();
                return Text(sleectedItem.toString());
              },
              items: HavaYolu.Airports,
              popupProps: PopupProps.bottomSheet(
                showSelectedItems: true,
                isFilterOnline: true,
                showSearchBox: true,
              ),
            ),
            DropdownSearch<String>(
              selectedItem: HavaYolu.Airports[1],
              dropdownBuilder: (context, sleectedItem) {
                nereye = sleectedItem.toString();
                print(sleectedItem.toString());
                return Text(sleectedItem.toString());
              },
              items: HavaYolu.Airports,
              popupProps: PopupProps.bottomSheet(
                showSelectedItems: true,
                isFilterOnline: true,
                showSearchBox: true,
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            // TextField(
            //   controller: dateController, //editing controller of this TextField
            //   decoration: const InputDecoration(
            //         icon: Icon(Icons.calendar_today), //icon of text field
            //        labelText: "Enter Date" //label text of field

            // ),
            // readOnly: true,  // when true user cannot edit text
            // onTap: () async {
            //       //when click we have to show the datepicker
            // }
            // ),
            ElevatedButton(
              child: const Text('Ucus Sec'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UcusSec(
                      nerden: nerden,
                      nereye: nereye,
                      tarih: tarih,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Nerden extends StatefulWidget {
  const Nerden({super.key});

  @override
  State<Nerden> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<Nerden> {
  String dropdownValue = HavaYolu.Airports.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: HavaYolu.Airports.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          nerden = value;
          print(nerden);
        });
      },
      dropdownMenuEntries:
          HavaYolu.Airports.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class Nereye extends StatefulWidget {
  const Nereye({super.key});

  @override
  State<Nereye> createState() => Air();
}

class Air extends State<Nereye> {
  String dropdownValue = HavaYolu.Airports[0];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: HavaYolu.Airports[2],
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          nereye = value;
          print(nereye);
        });
      },
      dropdownMenuEntries:
          HavaYolu.Airports.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
