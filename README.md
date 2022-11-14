# **simple_chips_input**
<img src="https://img.shields.io/github/stars/danger-ahead/simple_chips_input" /> <img src="https://img.shields.io/github/license/danger-ahead/simple_chips_input" />

## Importing the package
```dart
import 'package:simple_chips_input/simple_chips_input.dart';
```

## Working
<img src="https://imgur.com/2pVOl0E.gif" width="300px" height="auto" />
<img src="https://imgur.com/1MLeFZt.gif" width="300px" height="auto" />

## Usage
```dart
SimpleChipsInput(
    separatorCharacter: ",",
    validateInput: true,
    validateInputMethod: (String value) {
        //some function to validate the input
    },
    widgetContainerDecoration: BoxDecoration(
        //how the main widget container looks
    ),
    onSubmitted: (p0) {
        //something
    },
    //....other properties
),
```

### Author
[@danger-ahead](https://github.com/danger-ahead/)
