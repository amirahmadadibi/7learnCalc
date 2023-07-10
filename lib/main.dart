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
    if (text == 'ac') {
      setState(() {
        input = '';
        result = '';
      });
      return;
    }
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
      if (input.length > 0) {
        setState(() {
          input = input.substring(0, input.length - 1);
        });
      }
      return;
    }

    setState(() {
      input = input + text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Color(0xffffffff),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 36,
                            width: 148,
                            child: Image.asset('assets/images/logo.png')),
                      ),
                      Spacer(),
                      Text(
                        input,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xffAAB0BD)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        result,
                        style:
                            TextStyle(fontSize: 50, color: Color(0xff000000)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: Color(0xffffffff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        GestureDetector(
          onTap: () {
            negahban(text1);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: getBackgroundColor(text1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                text1,
                style: TextStyle(
                    fontSize: getLableActionSize(text1),
                    color: getLableColor(text1)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            negahban(text2);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: getBackgroundColor(text2),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                text2,
                style: TextStyle(
                    fontSize: getLableActionSize(text2),
                    color: getLableColor(text2)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            negahban(text3);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: getBackgroundColor(text3),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                text3,
                style: TextStyle(
                    fontSize: getLableActionSize(text3),
                    color: getLableColor(text3)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            negahban(text4);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: getBackgroundColor(text4),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                text4,
                style: TextStyle(
                    fontSize: getLableActionSize(text4),
                    color: getLableColor(text4)),
              ),
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
      return Color(0xff007BEC);
    } else {
      return Color(0xff000000);
    }
  }

  double getLableActionSize(String text) {
    if (isCharAFunction(text)) {
      return 25;
    } else {
      return 30;
    }
  }

  Color getBackgroundColor(String text) {
    if (isCharAFunction(text)) {
      return Color(0xff1A007BEC);
    } else {
      return Color(0xffF5F5F5);
    }
  }
}
