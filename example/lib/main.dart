import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:simple_chips_input/simple_chips_input.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simple Chips Input Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Example:\nChips with standard email validation',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Text(
            'Output:\n$output',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleChipsInput(
              separatorCharacter: ",",
              validateInput: true,
              validateInputMethod: (String value) {
                final emailRegExp = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              },
              onSubmitted: (p0) {
                setState(() {
                  output = p0;
                });
              },
              widgetContainerDecoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.blue),
              ),
              chipContainerDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              placeChipsSectionAbove: false,
            ),
          ),
        ],
      ),
    );
  }
}
