// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:simple_chips_input/select_chips_input.dart';

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
              chipsText: const ['door', 'window'],
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
        ],
      ),
    );
  }
}
