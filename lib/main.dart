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
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        KeyboardRow('ac', 'ce', '%', '/'),
                        KeyboardRow('7', '8', '9', '*'),
                        KeyboardRow('4', '5', '6', '-'),
                        KeyboardRow('1', '2', '3', '+'),
                        KeyboardRow('00', '0', '.', '='),
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
  KeyboardRow(this.text1, this.text2, this.text3, this.text4, {super.key});

  var color = Colors.black;
  String text1;
  String text2;
  String text3;
  String text4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text1,
              style: TextStyle(fontSize: 26, color: color),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text2,
              style: TextStyle(fontSize: 26, color: color),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text3,
              style: TextStyle(fontSize: 26, color: color),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text4,
              style: TextStyle(fontSize: 26, color: color),
            ),
          ),
        ),
      ],
    );
  }
}
