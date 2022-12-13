// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';

/// The [SelectChipsInput] widget is a text field that allows the user to select chips and get the selected chips as output.
class SelectChipsInput extends StatefulWidget {
  /// Creates a [SelectChipsInput] widget.
  /// 
  /// Read the [API reference](https://pub.dev/documentation/simple_chips_input/latest/select_chips_input/select_chips_input-library.html) for full documentation.
  const SelectChipsInput({
    super.key,
    required this.chipsText,
    this.suffixIcons = null,
    this.prefixIcons = null,
    this.selectedPrefixIcon = null,
    this.selectedSuffixIcon = null,
    this.selectedPrefixIcons = null,
    this.selectedSuffixIcons = null,
    required this.separatorCharacter,
    this.selectedChipDecoration = const BoxDecoration(),
    this.unselectedChipDecoration = const BoxDecoration(),
    this.marginBetweenChips =
        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
    this.paddingInsideChipContainer =
        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
    this.paddingInsideWidgetContainer = const EdgeInsets.all(8.0),
    this.widgetContainerDecoration = const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    this.selectedChipTextStyle = const TextStyle(color: Colors.white),
    this.unselectedChipTextStyle = const TextStyle(color: Colors.white),
    this.onTap,
  });

  /// Character to seperate the output. For example: ' ' will seperate the output by space.
  final String separatorCharacter;

  /// Decoration for the selected chip container.
  final BoxDecoration selectedChipDecoration;

  /// Decoration for the unselected chip container.
  final BoxDecoration unselectedChipDecoration;

  /// Margin between the chips.
  final EdgeInsets marginBetweenChips;

  /// Padding inside the chip container.
  final EdgeInsets paddingInsideChipContainer;

  /// Padding inside the main widget container;
  final EdgeInsets paddingInsideWidgetContainer;

  /// Decoration for the chip container.
  final BoxDecoration widgetContainerDecoration;

  /// Text style for the chip.
  final TextStyle unselectedChipTextStyle;

  /// Text style for the chip.
  final TextStyle selectedChipTextStyle;

  /// Chip text list.
  final List<String> chipsText;

  /// Prefix icon list, if a particular chip doesn't need to have a prefix icon, pass null in its corresponding place.
  final List<Widget?>? prefixIcons;

  /// Prefix icon list that will be shown when the chip is selected.
  final List<Widget?>? selectedPrefixIcons;

  /// Suffix icon list, if a particular chip doesn't need to have a suffix icon, pass null in its corresponding place.
  final List<Widget?>? suffixIcons;

  /// Suffix icon list that will be shown when the chip is selected.
  final List<Widget?>? selectedSuffixIcons;

  /// selected Suffix icon (1 icon applies to all selected chips)
  final Widget? selectedSuffixIcon;

  /// selected Prefix icon (1 icon applies to all selected chips)
  final Widget? selectedPrefixIcon;

  /// Callback when the chip is tapped, returns output and index of last chip selected.
  final void Function(String, int)? onTap;

  @override
  State<SelectChipsInput> createState() => _SelectChipsInputState();
}

class _SelectChipsInputState extends State<SelectChipsInput> {
  final List<int> _selectedChipsIndex = [];

  @override
  void initState() {
    super.initState();
    assert(widget.chipsText.isNotEmpty);
    if (widget.prefixIcons != null) {
      assert(widget.chipsText.length == widget.prefixIcons!.length);
    }
    if (widget.suffixIcons != null) {
      assert(widget.chipsText.length == widget.suffixIcons!.length);
    }
    if (widget.selectedPrefixIcons != null) {
      assert(widget.chipsText.length == widget.selectedPrefixIcons!.length);
      assert(widget.selectedPrefixIcon == null);
    }
    if (widget.selectedSuffixIcons != null) {
      assert(widget.chipsText.length == widget.selectedSuffixIcons!.length);
      assert(widget.selectedSuffixIcon == null);
    }
    if (widget.selectedPrefixIcon != null) {
      assert(widget.selectedPrefixIcons == null);
    }
    if (widget.selectedSuffixIcon != null) {
      assert(widget.selectedSuffixIcons == null);
    }
  }

  List<Widget> _buildChipsSection() {
    final List<Widget> chips = [];
    for (int i = 0; i < widget.chipsText.length; i++) {
      chips.add(GestureDetector(
        onTap: () {
          setState(() {
            if (_selectedChipsIndex.contains(i)) {
              _selectedChipsIndex.remove(i);
            } else {
              _selectedChipsIndex.add(i);
            }
          });
          if (widget.onTap != null) {
            String output = '';
            for (int i in _selectedChipsIndex) {
              output += widget.chipsText[i] + widget.separatorCharacter;
            }
            widget.onTap!(output, i);
          }
        },
        child: Container(
          padding: widget.paddingInsideChipContainer,
          margin: widget.marginBetweenChips,
          decoration: _selectedChipsIndex.contains(i)
              ? widget.selectedChipDecoration
              : widget.unselectedChipDecoration,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.selectedPrefixIcon != null &&
                  _selectedChipsIndex.contains(i))
                widget.selectedPrefixIcon as Widget,
              if (_selectedChipsIndex.contains(i) &&
                  widget.selectedPrefixIcons != null &&
                  widget.selectedPrefixIcons![i] != null)
                widget.selectedPrefixIcons![i] as Widget,
              // no selected prefix icons are provided
              if ((widget.prefixIcons != null &&
                      widget.prefixIcons![i] != null &&
                      !_selectedChipsIndex.contains(i)) ||
                  (widget.prefixIcons != null &&
                      widget.selectedPrefixIcons == null &&
                      widget.selectedPrefixIcon == null))
                widget.prefixIcons![i] as Widget,
              Flexible(
                child: Text(
                  widget.chipsText[i],
                  style: _selectedChipsIndex.contains(i)
                      ? widget.selectedChipTextStyle
                      : widget.unselectedChipTextStyle,
                ),
              ),
              if (widget.selectedSuffixIcon != null &&
                  _selectedChipsIndex.contains(i))
                widget.selectedSuffixIcon as Widget,
              if (_selectedChipsIndex.contains(i) &&
                  widget.selectedSuffixIcons != null &&
                  widget.selectedSuffixIcons![i] != null)
                widget.selectedSuffixIcons![i] as Widget,
              // no selected suffix icons are provided
              if ((widget.suffixIcons != null &&
                      widget.suffixIcons![i] != null &&
                      !_selectedChipsIndex.contains(i)) ||
                  (widget.suffixIcons != null &&
                      widget.selectedSuffixIcons == null &&
                      widget.selectedSuffixIcon == null))
                widget.suffixIcons![i] as Widget,
            ],
          ),
        ),
      ));
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.paddingInsideWidgetContainer,
      decoration: widget.widgetContainerDecoration,
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            ..._buildChipsSection(),
          ],
        ),
      ),
    );
  }
}
