# **simple_chips_input**
<img src="https://img.shields.io/github/stars/danger-ahead/simple_chips_input" /> <img src="https://img.shields.io/github/license/danger-ahead/simple_chips_input" />

## Importing the package
```dart
import 'package:simple_chips_input/simple_chips_input.dart';
```

## Working
![simple_chips_input](https://user-images.githubusercontent.com/55531939/201486835-ffe0572b-3996-43be-9f72-1e7abc129e86.gif)

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
