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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '1',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '3',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '4',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
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
