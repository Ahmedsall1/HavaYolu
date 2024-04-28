import 'package:flutter/material.dart';
import 'package:havayolu/Classes/HavaYolu.dart';
import 'package:havayolu/Classes/Koltuk.dart';
import 'package:havayolu/Pages/Yolcu/Bilet.dart';
import 'package:havayolu/Classes/Ucak.dart';
import 'package:havayolu/Classes/Ucus.dart';

bool isSelected = false;

class KoltukSec extends StatelessWidget {
  int id;
  late Ucus ucus;

  KoltukSec({super.key, required this.id}) {
    ucus = HavaYolu.GetUcus(id);
    ucus.ucak.kolutkList[4][4].durum = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koltuk Sec'),
      ),
      body: GridView.count(
        crossAxisCount: ucus.ucak.harfSayisi,
        children: List.generate(
          (ucus.ucak.kolutkList.length - 1) * ucus.ucak.kolutkList.first.length,
          (index) {
            int rowIndex = (index ~/ ucus.ucak.kolutkList.first.length) + 1;
            int colIndex = index % ucus.ucak.kolutkList.first.length;
            String chairNo = ucus.ucak.kolutkList[rowIndex][colIndex].No;
            bool isChairFull = ucus.ucak.kolutkList[rowIndex][colIndex].durum;

            return Center(
              child: isChairFull
                  ? _buildDisabledChair(
                      chairNo) // Render disabled chair if it's already full
                  : GestureDetector(
                      onTap: () {
                        // Handle chair selection logic here
                        print('Chair No: $chairNo selected');
                        _showDialog(context, chairNo, rowIndex, colIndex);
                      },
                      child:
                          _buildEnabledChair(chairNo), // Render enabled chair
                    ),
            );
          },
        ),
      ),
      // Center(
      //   child: ElevatedButton(
      //     child: const Text('Bilet'),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const Bilet()),
      //       );
      //     },
      //   ),
      // ),
    );
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
                      builder: (context) =>
                          Bilet(ucus: ucus, koltuk: ucus.ucak.kolutkList[row][col])),
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
      padding: EdgeInsets.all(8.0), // Add padding to the Text widget
      child: Text(
        chairNo,
      ),
    ),
  );
}

Widget _buildEnabledChair(String chairNo) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
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
