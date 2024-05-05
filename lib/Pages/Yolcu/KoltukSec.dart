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
                                print('Chair No: $chairNo selected');
                                _showDialog(
                                    context, chairNo, rowIndex, colIndex);
                              },
                              child: _buildEnabledChair(chairNo,ucus.ucak.kolutkList[rowIndex][colIndex]),
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

  void _showDialog(BuildContext context, String No, int row, int col) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kesinleştir'),
          content: Text('Seçtiniz Koltuk : ' + No),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
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
              child: Text('Sec'),
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
      padding: EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        chairNo,
      ),
    ),
  );
}

Widget isSelectedd(String chairNo, int index, Koltuk koltuk) {
  Color color = Colors.blue;
  if (koltuk.koltuktipi == Koltuk.tipi[0]) {
    color = const Color(0xFFFDDE55);
  }
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
      padding: EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        chairNo,
      ),
    ),
  );
}

Widget _buildEnabledChair(String chairNo, Koltuk koltuk) {
  Color color = Colors.blue;
  if (koltuk.koltuktipi == Koltuk.tipi[0]) {
    color = const Color(0xFFFDDE55);
  } else if (koltuk.koltuktipi == Koltuk.tipi[2]) {
    color = Colors.white;
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
      padding: EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        style: const TextStyle(
              color: Color(0xFF005096),
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w600,
            ),
        chairNo,
      ),
    ),
  );
}
