import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Pages/Yolcu/Kesinlestir.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Ucus.dart';

bool isSelected = false;

class KoltukSec extends StatelessWidget {
  int id;
  late Ucus ucus;

  KoltukSec({super.key, required this.id}) {
    ucus = HavaYolu.GetUcus(id);
    ucus.ucak.kolutkList[1][1].durum = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Koltuk Seç',
            style: TextStyle(
              color: Color(0xFF005096),
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            const Card(
              color: const Color.fromARGB(255, 0, 80, 150),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Standart",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Business",
                          style: TextStyle(
                            color: Color(0xFFFDDE55),
                            fontSize: 20,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Ekonomik",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150.0,
                        ),
                        Text(
                          "Dolu",
                          style: TextStyle(
                            color: Color.fromARGB(255, 179, 0, 0),
                            fontSize: 25,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Image.asset('images/UcakB.png'),
            Expanded(
              child: GridView.count(
                crossAxisCount: ucus.ucak.harfSayisi,
                children: List.generate(
                  (ucus.ucak.kolutkList.length - 1) *
                      ucus.ucak.kolutkList.first.length,
                  (index) {
                    int rowIndex =
                        (index ~/ ucus.ucak.kolutkList.first.length) + 1;
                    int colIndex = index % ucus.ucak.kolutkList.first.length;
                    String chairNo =
                        ucus.ucak.kolutkList[rowIndex][colIndex].No;
                    bool isChairFull =
                        ucus.ucak.kolutkList[rowIndex][colIndex].durum;

                    return Center(
                      child: isChairFull
                          ? _buildDisabledChair(chairNo)
                          : GestureDetector(
                              onTap: () {
                                // Handle chair selection logic here
                                // ignore: avoid_print
                                print('Chair No: $chairNo selected');
                                _showDialog(
                                    context,
                                    chairNo,
                                    rowIndex,
                                    colIndex,
                                    ucus.ucak.kolutkList[rowIndex][colIndex]
                                        .ucret);
                              },
                              child: _buildEnabledChair(chairNo,
                                  ucus.ucak.kolutkList[rowIndex][colIndex]),
                            ),
                    );
                  },
                ),
              ),
            ),
            // Image.asset('images/UcakS.png')
          ],
        ));
  }

  void _showDialog(
      // ignore: non_constant_identifier_names
      BuildContext context, String No, int row, int col, double ucret) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF005096),
          title: const Text(
            'Kesinleştir',
            style: TextStyle(
              color: Color(0xFFFDDE55),
              fontSize: 20.0,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Seçtiniz Koltuk : $No \nUcret: $ucret TL \nKoltuk Tipi: ${ucus.ucak.kolutkList[row][col].koltuktipi}',
            style: const TextStyle(
              color: Color(0xFFFDDE55),
              fontSize: 14.0,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'iptal',
                style: TextStyle(
                  color: Color(0xFFFDDE55),
                  fontSize: 16.0,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Kesinlestir(
                          ucus: ucus, koltuk: ucus.ucak.kolutkList[row][col])),
                );
              },
              child: const Text(
                'Sec',
                style: TextStyle(
                  color: Color(0xFFFDDE55),
                  fontSize: 16.0,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildDisabledChair(String chairNo) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(
        color: Colors.red, // Change border color based on isSelected state
        width: 2.0, // Border width
        style: BorderStyle.solid,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        style: const TextStyle(decoration: TextDecoration.lineThrough,),
        chairNo,
      ),
    ),
  );
}

Widget isSelectedd(String chairNo, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green,
      border: Border.all(
        color: isSelected
            ? Colors.green
            : Colors.blue, // Change border color based on isSelected state
        width: 2.0, // Border width
        style: BorderStyle.solid,
      ),
    ),
    child: Padding(
      padding:const EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        style: const TextStyle(
          fontFamily: "Times New Roman",
          fontWeight: FontWeight.w600,
        ),
        chairNo,
      ),
    ),
  );
}

Widget _buildEnabledChair(String chairNo, Koltuk koltuk) {
  Color txtcolor = const Color(0xFF005096);
  Color color = Colors.blue;
  if (koltuk.koltuktipi == Koltuk.tipi[0]) {
    color = const Color(0xFFFDDE55);
  } else if (koltuk.koltuktipi == Koltuk.tipi[2]) {
    color = Colors.white;
  }
  else {
    txtcolor= Colors.white;
  }
  return Container(
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: isSelected
            ? Colors.green
            : Colors.blue, // Change border color based on isSelected state
        width: 2.0, // Border width
        style: BorderStyle.solid,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        style:  TextStyle(
          color: txtcolor,
          
          fontFamily: "Times New Roman",
          fontWeight: FontWeight.w600,
        ),
        chairNo,
      ),
    ),
  );
}
