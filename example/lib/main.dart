// main.dart only contains the code to run the example app
// refer to select_chips_input_example.dart for the actual example
// refer to simple_chips_input_example.dart for the actual example

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'select_chips_input_example.dart';
import 'simple_chips_input_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _index;
  final List<Widget> _body = [
    const SimpleChipsInputWidget(),
    const SelectChipsInputWidget(),
  ];

  late Widget _currentBody;

  @override
  void initState() {
    super.initState();
    _index = 1;
    _currentBody = _body[_index];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _currentBody,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            selectedItemColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.keyboard),
                label: 'Chips Input',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.touch_app),
                label: 'Select Chips Input',
              ),
            ],
            onTap: (value) {
              setState(() {
                _index = value;
                _currentBody = _body[_index];
              });
            },
          )),
    );
  }
}
