import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Color(0xffF1F6F9),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: Color(0xff394867),
                    child: Column(
                      children: [
                        KeyboardRow('ac', 'ce', '%', '/', (itemLable) {
                          print(itemLable);
                        }),
                        KeyboardRow('7', '8', '9', '*', (itemLable) {
                          print(itemLable);
                        }),
                        KeyboardRow('4', '5', '6', '-', (itemLable) {
                          print(itemLable);
                        }),
                        KeyboardRow('1', '2', '3', '+', (itemLable) {
                          print(itemLable);
                        }),
                        KeyboardRow('00', '0', '.', '=', (itemLable) {
                          print(itemLable);
                        }),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardRow extends StatelessWidget {
  KeyboardRow(this.text1, this.text2, this.text3, this.text4, this.negahban,
      {super.key});

  var lableColor = Color(0xff9BA4B5);
  var buttonBackground = Color(0xff212A3E);
  String text1;
  String text2;
  String text3;
  String text4;
  Function(String) negahban;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            negahban(text1);
          },
          style: TextButton.styleFrom(backgroundColor: buttonBackground),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text1,
              style: TextStyle(fontSize: 26, color: getLableColor(text1)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            negahban(text2);
          },
          style: TextButton.styleFrom(backgroundColor: buttonBackground),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text2,
              style: TextStyle(fontSize: 26, color: getLableColor(text2)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            negahban(text3);
          },
          style: TextButton.styleFrom(backgroundColor: buttonBackground),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text3,
              style: TextStyle(fontSize: 26, color: getLableColor(text3)),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            negahban(text4);
          },
          style: TextButton.styleFrom(backgroundColor: buttonBackground),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text4,
              style: TextStyle(fontSize: 26, color: getLableColor(text4)),
            ),
          ),
        ),
      ],
    );
  }

  bool isCharAFunction(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var item in list) {
      if (item == text) {
        return true;
      }
    }
    return false;
  }

  Color getLableColor(String text) {
    if (isCharAFunction(text)) {
      return Color(0xff655DBB);
    } else {
      return Color(0xff9BA4B5);
    }
  }
}
