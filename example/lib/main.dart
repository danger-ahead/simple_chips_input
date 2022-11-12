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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Output:\n$output',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, color: Colors.blue),
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
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
