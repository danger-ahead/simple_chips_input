library simple_chips_input;

import 'package:flutter/material.dart';
import 'package:simple_chips_input/text_form_field_syle.dart';

class SimpleChipsInput extends StatefulWidget {
  const SimpleChipsInput({
    super.key,
    required this.separatorCharacter,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.marginBetweenChips =
        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
    this.paddingBetweenChips =
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
    this.chipContainerDecoration = const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    this.chipTextStyle = const TextStyle(color: Colors.white),
    this.deleteIconPadding = const EdgeInsets.only(left: 5.0),
    this.autoFocus = false,
    this.controller,
    this.createCharacter = ' ',
    this.deleteChip = true,
    this.deleteIcon = Icons.close,
    this.deleteIconColor = Colors.white,
    this.deleteIconSize = 14.0,
    this.validateInput = false,
    this.validateInputMethod,
    this.eraseKeyLabel = 'Backspace',
    this.formKey,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  /// character to seperate the output from the chips input (plus the textfield)
  final String separatorCharacter;

  /// decoration for the main widget container
  final BoxDecoration widgetContainerDecoration;

  /// margin between the chips
  final EdgeInsets marginBetweenChips;

  /// padding between the chips
  final EdgeInsets paddingBetweenChips;

  /// decoration for the chip container
  final BoxDecoration chipContainerDecoration;

  /// controller for the textfield
  final TextEditingController? controller;

  /// the input character used for creating a chip
  final String createCharacter;

  /// whether the chip should contain a delete method
  final bool deleteChip;

  /// text style for the chip
  final TextStyle chipTextStyle;

  /// icon for the delete method
  final IconData deleteIcon;

  /// delete icon button padding
  final EdgeInsets deleteIconPadding;

  /// delete icon size
  final double deleteIconSize;

  /// delete icon color
  final Color deleteIconColor;

  /// whether to validate input before adding to chip
  final bool validateInput;

  /// validation method
  final dynamic Function(String)? validateInputMethod;

  /// the key label used for erasing a chip
  final String eraseKeyLabel;

  /// whether to autofocus the widget
  final bool autoFocus;

  /// form key to access or validate the form outside the widget
  final GlobalKey<FormState>? formKey;

  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;

  @override
  State<SimpleChipsInput> createState() => _SimpleChipsInputState();
}

class _SimpleChipsInputState extends State<SimpleChipsInput> {
  late final TextEditingController _controller;
  // ignore: prefer_typing_uninitialized_variables
  late final _formKey;
  final List<String> _chipsText = [];
  late final TextFormFieldStyle _textFormFieldStyle;

  String _output = '';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _formKey = widget.formKey ?? GlobalKey<FormState>();
    _textFormFieldStyle = const TextFormFieldStyle(
      maxLines: 1,
      minLines: 1,
      enableSuggestions: true,
      showCursor: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: widget.widgetContainerDecoration,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              for (int i = 0; i < _chipsText.length; i++) ...[
                Container(
                  padding: widget.paddingBetweenChips,
                  margin: widget.marginBetweenChips,
                  decoration: widget.chipContainerDecoration,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: widget.paddingBetweenChips,
                        child: Text(
                          _chipsText[i],
                          style: widget.chipTextStyle,
                        ),
                      ),
                      if (widget.deleteChip)
                        Padding(
                          padding: widget.deleteIconPadding,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _chipsText.removeAt(i);
                              });
                            },
                            child: Icon(
                              widget.deleteIcon,
                              size: widget.deleteIconSize,
                              color: widget.deleteIconColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              RawKeyboardListener(
                autofocus: widget.autoFocus,
                focusNode: FocusNode(),
                onKey: (event) {
                  if (event.data.logicalKey.keyLabel == widget.eraseKeyLabel) {
                    if (_controller.text.isEmpty && _chipsText.isNotEmpty) {
                      setState(() {
                        _chipsText.removeLast();
                      });
                    }
                  }
                },
                child: TextFormField(
                  autofocus: widget.autoFocus,
                  controller: _controller,
                  keyboardType: _textFormFieldStyle.keyboardType,
                  maxLines: _textFormFieldStyle.maxLines,
                  minLines: _textFormFieldStyle.minLines,
                  enableSuggestions: _textFormFieldStyle.enableSuggestions,
                  showCursor: _textFormFieldStyle.showCursor,
                  cursorWidth: _textFormFieldStyle.cursorWidth,
                  cursorColor: _textFormFieldStyle.cursorColor,
                  cursorRadius: _textFormFieldStyle.cursorRadius,
                  cursorHeight: _textFormFieldStyle.cursorHeight,
                  onChanged: (value) {
                    if (value.endsWith(widget.createCharacter)) {
                      _controller.text = _controller.text
                          .substring(0, _controller.text.length - 1);
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _chipsText.add(_controller.text);
                          _output +=
                              _controller.text + widget.separatorCharacter;
                          _controller.clear();
                        });
                      }
                      widget.onChanged?.call(value);
                    }
                  },
                  decoration: _textFormFieldStyle.decoration,
                  validator: (value) {
                    if (widget.validateInput &&
                        widget.validateInputMethod != null) {
                      return widget.validateInputMethod!(value!);
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    widget.onEditingComplete?.call();
                  },
                  onFieldSubmitted: ((value) {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        if (_controller.text.isNotEmpty) {
                          _chipsText.add(_controller.text);
                          _output +=
                              _controller.text + widget.separatorCharacter;
                          _controller.clear();
                        }
                      });
                    }
                    widget.onSubmitted?.call(_output);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
