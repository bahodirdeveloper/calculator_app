import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String output = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Ekran
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Tugmalar
          Expanded(
            flex: 5,
            child: Column(
              children: [
                _buildButtonRow(["AC", "±", "%", "÷"], [Colors.grey, Colors.grey, Colors.grey, Colors.orange]),
                _buildButtonRow(["7", "8", "9", "×"], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                _buildButtonRow(["4", "5", "6", "−"], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                _buildButtonRow(["1", "2", "3", "+"], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                _buildButtonRow(["0", ".", "=", ""], [Colors.grey[850]!, Colors.grey[850]!, Colors.orange, Colors.transparent], isLastRow: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, List<Color> colors, {bool isLastRow = false}) {
    return Expanded(
      child: Row(
        children: buttons.asMap().entries.map((entry) {
          int index = entry.key;
          String buttonText = entry.value;

          // "Bo'sh" joyni oxirgi qator uchun to'ldirish
          if (buttonText.isEmpty && isLastRow) {
            return Expanded(child: SizedBox.shrink());
          }

          return Expanded(
            flex: buttonText == "0" && isLastRow ? 2 : 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Bosish funksiyasi
                  if (buttonText == "AC") {
                    output = "0";
                  } else if (buttonText == "=") {
                    output = "Result"; // Hisoblash logikasini qo'shing
                  } else {
                    output += buttonText;
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors[index],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
