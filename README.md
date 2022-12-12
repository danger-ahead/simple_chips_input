# **simple_chips_input**
<img src="https://img.shields.io/github/stars/danger-ahead/simple_chips_input" /> <img src="https://img.shields.io/github/license/danger-ahead/simple_chips_input" />

## Contents
- Create chips from user's text input and get the value after form submission
- Select pre-defined chips to get the value of selected chips

## Importing the package
```dart
import 'package:simple_chips_input/simple_chips_input.dart';
import 'package:simple_chips_input/select_chips_input.dart';
```

## Working
<img src="https://imgur.com/2pVOl0E.gif" width="200px" height="auto" />
<img src="https://imgur.com/1MLeFZt.gif" width="200px" height="auto" />
<img src="https://imgur.com/Crv5PlR.gif" width="200px" height="auto" />

## Example usage, refer [API reference](https://pub.dev/documentation/simple_chips_input/latest/) for full documentation
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
)
```

```dart
SelectChipsInput(
    chipsText: const ['sun', 'cloud', 'moon'],
    separatorCharacter: ",",
    selectedChipTextStyle: const TextStyle(
        //some text style
    ),
    unselectedChipTextStyle: const TextStyle(
        //some style
    ),
    onTap: (output) {
        //output contains the end value
    },
    prefixIcons: const [null, Icon(Icons.cloud), null],
    suffixIcons: const [Icon(Icons.sunny), null, Icon(Icons.circle)],
    unselectedChipDecoration: BoxDecoration(
        //some decoration
    ),
    selectedChipDecoration: BoxDecoration(
        //some decoration
    ),
),
```

### Author
[@danger-ahead](https://github.com/danger-ahead/)
