import 'package:flutter/material.dart';
import 'package:simple_chips_input/src/text_form_field_syle.dart';

/// The [SimpleChipsInput] widget is a text field that allows the user to input and create chips out of it.
class SimpleChipsInput extends StatefulWidget {
  const SimpleChipsInput({
    super.key,
    required this.separatorCharacter,
    this.placeChipsSectionAbove = true,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.marginBetweenChips =
        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
    this.paddingInsideChipContainer =
        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
    this.paddingInsideWidgetContainer = const EdgeInsets.all(8.0),
    this.chipContainerDecoration = const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    this.textFormFieldStyle = const TextFormFieldStyle(),
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
    this.onSaved,
  });

  /// Character to seperate the output. For example: ' ' will seperate the output by space.
  final String separatorCharacter;

  /// Whether to place the chips section above or below the text field.
  final bool placeChipsSectionAbove;

  /// Decoration for the main widget container.
  final BoxDecoration widgetContainerDecoration;

  /// Margin between the chips.
  final EdgeInsets marginBetweenChips;

  /// Padding inside the chip container.
  final EdgeInsets paddingInsideChipContainer;

  /// Padding inside the main widget container;
  final EdgeInsets paddingInsideWidgetContainer;

  /// Decoration for the chip container.
  final BoxDecoration chipContainerDecoration;

  /// Controller for the textfield.
  final TextEditingController? controller;

  /// The input character used for creating a chip.
  final String createCharacter;

  /// Whether the chip should contain a delete method.
  final bool deleteChip;

  /// Text style for the chip.
  final TextStyle chipTextStyle;

  /// Icon for the delete method.
  final IconData deleteIcon;

  /// Delete icon button padding.
  final EdgeInsets deleteIconPadding;

  /// Delete icon size.
  final double deleteIconSize;

  /// Delete icon color.
  final Color deleteIconColor;

  /// Whether to validate input before adding to a chip.
  final bool validateInput;

  /// Validation method.
  final dynamic Function(String)? validateInputMethod;

  /// The key label used for erasing a chip. Defaults to Backspace.
  final String eraseKeyLabel;

  /// Whether to autofocus the widget.
  final bool autoFocus;

  /// Form key to access or validate the form outside the widget.
  final GlobalKey<FormState>? formKey;

  /// Style for the textfield.
  final TextFormFieldStyle textFormFieldStyle;

  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String)? onSaved;

  @override
  State<SimpleChipsInput> createState() => _SimpleChipsInputState();
}

class _SimpleChipsInputState extends State<SimpleChipsInput> {
  late final TextEditingController _controller;
  // ignore: prefer_typing_uninitialized_variables
  late final _formKey;
  final List<String> _chipsText = [];

  String _output = '';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _formKey = widget.formKey ?? GlobalKey<FormState>();
  }

  List<Widget> _buildChipsSection() {
    final List<Widget> chips = [];
    for (int i = 0; i < _chipsText.length; i++) {
      chips.add(Container(
        padding: widget.paddingInsideChipContainer,
        margin: widget.marginBetweenChips,
        decoration: widget.chipContainerDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _chipsText[i],
              style: widget.chipTextStyle,
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
      ));
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: widget.paddingInsideWidgetContainer,
        decoration: widget.widgetContainerDecoration,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              if (widget.placeChipsSectionAbove) ...[
                ..._buildChipsSection(),
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
                  keyboardType: widget.textFormFieldStyle.keyboardType,
                  maxLines: widget.textFormFieldStyle.maxLines,
                  minLines: widget.textFormFieldStyle.minLines,
                  enableSuggestions:
                      widget.textFormFieldStyle.enableSuggestions,
                  showCursor: widget.textFormFieldStyle.showCursor,
                  cursorWidth: widget.textFormFieldStyle.cursorWidth,
                  cursorColor: widget.textFormFieldStyle.cursorColor,
                  cursorRadius: widget.textFormFieldStyle.cursorRadius,
                  cursorHeight: widget.textFormFieldStyle.cursorHeight,
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
                          _controller.clear();
                        });
                      }
                    }
                    widget.onChanged?.call(value);
                  },
                  decoration: widget.textFormFieldStyle.decoration,
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
                    _output = '';
                    for (String text in _chipsText) {
                      _output += text + widget.separatorCharacter;
                    }
                    if (value.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _chipsText.add(_controller.text);
                          _output +=
                              _controller.text + widget.separatorCharacter;
                          _controller.clear();
                        });
                      }
                    }
                    widget.onSubmitted?.call(_output);
                  }),
                  onSaved: (value) {
                    _output = '';
                    for (String text in _chipsText) {
                      _output += text + widget.separatorCharacter;
                    }
                    if (value!.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _chipsText.add(_controller.text);
                          _output +=
                              _controller.text + widget.separatorCharacter;
                          _controller.clear();
                        });
                      }
                    }
                    widget.onSaved?.call(_output);
                  },
                ),
              ),
              if (!widget.placeChipsSectionAbove) ...[
                ..._buildChipsSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
