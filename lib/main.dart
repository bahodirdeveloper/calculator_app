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
      body: SafeArea(
        child: Column(
          children: [
            // Ekran qismi
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
            // Tugmalar qismi
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _buildButtonRow(["AC", "±", "%", "÷"], Colors.grey),
                  _buildButtonRow(["7", "8", "9", "×"], Colors.black),
                  _buildButtonRow(["4", "5", "6", "−"], Colors.black),
                  _buildButtonRow(["1", "2", "3", "+"], Colors.black),
                  _buildButtonRow(["0", ".", "=", ""], Colors.black, isLastRow: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, Color backgroundColor,
      {bool isLastRow = false}) {
    return Expanded(
      child: Row(
        children: buttons.map((buttonText) {
          if (buttonText.isEmpty && isLastRow) {
            return Expanded(child: SizedBox.shrink());
          }
          return Expanded(
            flex: buttonText == "0" && isLastRow ? 2 : 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Bosish funksiyasi qo'shiladi
                  if (buttonText == "AC") {
                    output = "0";
                  } else if (buttonText == "=") {
                    output = "Result"; // Hisoblash funksiyasini qo'shing
                  } else {
                    output += buttonText;
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: buttonText == "=" || "+−×÷".contains(buttonText)
                      ? Colors.orange
                      : backgroundColor,
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
