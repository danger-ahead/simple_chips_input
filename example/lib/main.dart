/*
@Author: Shourya S. Ghosh
@License: MIT
*/

// refer [SelectChipsInputWidget](https://github.com/danger-ahead/simple_chips_input/blob/main/example/lib/main.dart#L86) for the actual example
// refer [SimpleChipsInputWidget](https://github.com/danger-ahead/simple_chips_input/blob/main/example/lib/main.dart#L353) for the actual example

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:simple_chips_input/select_chips_input.dart';
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
    _index = 0;
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

class SelectChipsInputWidget extends StatefulWidget {
  const SelectChipsInputWidget({super.key});

  @override
  State<SelectChipsInputWidget> createState() => _SelectChipsInputWidgetState();
}

class _SelectChipsInputWidgetState extends State<SelectChipsInputWidget> {
  String outputSelectChipsInput = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Output: $outputSelectChipsInput',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectChipsInput(
              chipsText: const ['lock', 'unlock'],
              separatorCharacter: ";",
              selectedChipTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              unselectedChipTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              onTap: (p0, p1) {
                setState(() {
                  outputSelectChipsInput = p0;
                });
              },
              prefixIcons: const [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.lock,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.lock_open,
                      size: 16.0,
                      color: Colors.white,
                    )),
              ],
              selectedPrefixIcon: const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.circle,
                  size: 16.0,
                  color: Colors.yellow,
                ),
              ),
              widgetContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.green[100]!.withOpacity(0.5),
              ),
              unselectedChipDecoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(10),
              ),
              selectedChipDecoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectChipsInput(
              chipsText: const ['sun', 'cloud', 'moon'],
              separatorCharacter: ",",
              selectedChipTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              unselectedChipTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              onTap: (p0, p1) {
                setState(() {
                  outputSelectChipsInput = p0;
                });
              },
              suffixIcons: const [
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.sunny,
                    size: 16.0,
                    color: Colors.yellow,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.cloud,
                      size: 16.0,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.circle,
                    size: 16.0,
                    color: Colors.grey,
                  ),
                )
              ],
              widgetContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.blue[100]!.withOpacity(0.5),
              ),
              unselectedChipDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              selectedChipDecoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectChipsInput(
              chipsText: const ['up', 'down'],
              separatorCharacter: ":",
              selectedChipTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              unselectedChipTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              onTap: (p0, p1) {
                setState(() {
                  outputSelectChipsInput = p0;
                });
              },
              prefixIcons: const [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.trending_up,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.trending_down,
                      size: 16.0,
                      color: Colors.white,
                    )),
              ],
              // removing prefix icon from chips on selection
              // the suffix icon can be removed on selection in the same way too
              selectedPrefixIcons: const [null, null],
              selectedSuffixIcons: const [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.trending_up,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.trending_down,
                      size: 16.0,
                      color: Colors.white,
                    )),
              ],
              widgetContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.amber[100]!.withOpacity(0.5),
              ),
              unselectedChipDecoration: BoxDecoration(
                color: Colors.amber[400],
                borderRadius: BorderRadius.circular(20),
              ),
              selectedChipDecoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text('Preselected chip feature:'),
          ),
          SelectChipsInput(
            chipsText: const ['door', 'window'],
            preSelectedChips: const [1],
            separatorCharacter: ".",
            selectedChipTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            unselectedChipTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            onTap: (p0, p1) {
              setState(() {
                outputSelectChipsInput = p0;
              });
            },
            prefixIcons: const [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.door_back_door_outlined,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.window,
                    size: 16.0,
                    color: Colors.white,
                  )),
            ],
            selectedSuffixIcon: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.check_box,
                size: 16.0,
              ),
            ),
            widgetContainerDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.orange[100]!.withOpacity(0.5),
            ),
            unselectedChipDecoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(10),
            ),
            selectedChipDecoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text('One chip selectable widget:'),
          ),
          SelectChipsInput(
              chipsText: const ['System', 'Light', 'Dark'],
              onlyOneChipSelectable: true,
              selectedChipDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              selectedChipTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              onTap: (output, index) {
                setState(() {
                  outputSelectChipsInput = output;
                });
              }),
        ],
      ),
    );
  }
}

class SimpleChipsInputWidget extends StatefulWidget {
  const SimpleChipsInputWidget({Key? key}) : super(key: key);

  @override
  State<SimpleChipsInputWidget> createState() => _SimpleChipsInputWidgetState();
}

class _SimpleChipsInputWidgetState extends State<SimpleChipsInputWidget> {
  String output = '';
  String? deletedChip, deletedChipIndex;
  final keySimpleChipsInput = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final TextFormFieldStyle style = const TextFormFieldStyle(
    keyboardType: TextInputType.phone,
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0.0),
      border: InputBorder.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Example:\nChips with phone number validation',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Text(
          deletedChip != null
              ? 'Deleted chip: $deletedChip at index $deletedChipIndex'
              : '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.blue),
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
            focusNode: focusNode,
            validateInput: true,
            formKey: keySimpleChipsInput,
            textFormFieldStyle: style,
            validateInputMethod: (String value) {
              final phoneNumberRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
              if (!phoneNumberRegExp.hasMatch(value)) {
                return 'Enter a valid phone number';
              }
            },
            onSubmitted: (p0) {
              setState(() {
                output = p0;
              });
            },
            onChipDeleted: (p0, p1) {
              setState(() {
                deletedChip = p0;
                deletedChipIndex = p1.toString();
              });
            },
            onSaved: ((p0) {
              setState(() {
                output = p0;
              });
            }),
            chipTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            deleteIcon: const Icon(
              Icons.delete,
              size: 14.0,
              color: Colors.black,
            ),
            widgetContainerDecoration: BoxDecoration(
              color: Colors.blue[100]!,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.blue[100]!),
            ),
            chipContainerDecoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(50),
            ),
            placeChipsSectionAbove: false,
          ),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: (() {
            keySimpleChipsInput.currentState!.save();
          }),
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
