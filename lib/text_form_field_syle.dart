import 'package:flutter/material.dart';

class TextFormFieldStyle {
  const TextFormFieldStyle(
      {this.maxLines = 1,
      this.minLines = 1,
      this.enableSuggestions = true,
      this.showCursor = true,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardType = TextInputType.text,
      this.decoration = const InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        border: InputBorder.none,
      )});

  /// The maximum number of lines for the text field.
  final int maxLines;

  /// The minimum number of lines for the text field.
  final int minLines;

  /// whether to show suggestions
  final bool enableSuggestions;

  /// whether to show the cursor
  final bool showCursor;

  /// The width of the cursor.
  final double cursorWidth;

  /// The height of the cursor.
  final double? cursorHeight;

  /// The radius of the cursor.
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  final Color? cursorColor;

  /// keyboard type for the textfield
  final TextInputType keyboardType;

  /// The style of the textfield.
  final InputDecoration decoration;
}
