import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/widgets.dart';
// import 'package:havayolu/Classes/Yolcu.dart';
import 'package:havayolu/Pages/Yolcu/UcusSec.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
// import 'package:havayolu/Classes/Sefer.dart';

var nerden = " ";
var nereye = " ";
DateTime tarih = DateTime.now();

class SeferBul extends StatefulWidget {
  SeferBul({Key? key}) : super(key: key);

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sefer Bul'),

      ),

      body: Column(
        children: [
          // const Nerden(),
          // const Nereye(),

          Card(
            color: const Color.fromARGB(255, 0, 80, 150),
            elevation: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Image.asset(
                        'images/Ucus.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "Nerden",
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownSearch<String>(
                    selectedItem: HavaYolu.Airports[0],
                    dropdownBuilder: (context, sleectedItem) {
                      nerden = sleectedItem.toString();

                      return Text(sleectedItem.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ));
                    },
                    items: HavaYolu.Airports,
                    popupProps: const PopupProps.bottomSheet(
                      showSelectedItems: true,
                      isFilterOnline: true,
                      showSearchBox: true,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    dropdownSearchDecoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5.0,
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Image.asset(
                        'images/Inis.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "Nereye",
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownSearch<String>(
                    selectedItem: HavaYolu.Airports[1],
                    dropdownBuilder: (context, sleectedItem) {
                      nereye = sleectedItem.toString();
                      return Text(sleectedItem.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ));
                    },
                    items: HavaYolu.Airports,
                    popupProps: const PopupProps.bottomSheet(
                      showSelectedItems: true,
                      isFilterOnline: true,
                      showSearchBox: true,
                    ),
                    dropdownSearchDecoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 5.0,
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.date_range_outlined,
                                color: Color(0xFF005096),
                              ),
                              Text(
                                ' ${selectedDate.toLocal().day}/${selectedDate.toLocal().month}/${selectedDate.toLocal().year}',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 0, 80, 150)),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                              0xFFFDDE55), // Set background color to RGB(253, 222, 85)
                        ),
                        child: const Text(
                          'Ucus Sec',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 80, 150),
                            fontSize: 20.0,
                          ),
                        ),
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
                ],
              ),
            ),
          ),
        ],
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
        });
      },
      dropdownMenuEntries:
          HavaYolu.Airports.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
