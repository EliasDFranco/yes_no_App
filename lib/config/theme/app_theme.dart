import 'package:flutter/material.dart';

const Color _customColor = Color(0x001B1BEE);
const List<Color> _colorThemes = [
  _customColor,
  Colors.white,
  Colors.yellowAccent,
  Colors.purpleAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1,
            'Los colores son del 0 al ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
