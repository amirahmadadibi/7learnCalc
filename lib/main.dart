import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String input = '';
  String result = '';
  void onKeyboardItemClick(String text) {
    if (text == '=') {
      Parser parser = Parser();
      Expression expression = parser.parse(input);
      ContextModel contextModel = ContextModel();
      double resultExpersion =
          expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        result = resultExpersion.toString();
      });
      return;
    }

    if (text == 'ce') {
      setState(() {
        input = input.substring(0, input.length - 1);
      });
      return;
    }

    setState(() {
      input = input + text;
    });
  }

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
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Color(0xffF1F6F9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        input,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        result,
                        style:
                            TextStyle(fontSize: 40, color: Color(0xff655DBB)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: Color(0xff394867),
                    child: Column(
                      children: [
                        KeyboardRow('ac', 'ce', '%', '/', onKeyboardItemClick),
                        KeyboardRow('7', '8', '9', '*', onKeyboardItemClick),
                        KeyboardRow('4', '5', '6', '-', onKeyboardItemClick),
                        KeyboardRow('1', '2', '3', '+', onKeyboardItemClick),
                        KeyboardRow('00', '0', '.', '=', onKeyboardItemClick),
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
